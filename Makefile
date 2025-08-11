# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hmunoz-g <hmunoz-g@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/28 13:10:42 by nponchon          #+#    #+#              #
#    Updated: 2025/08/11 15:56:51 by hmunoz-g         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DEF_COLOR   = \033[0;39m
YELLOW      = \033[0;93m
CYAN        = \033[0;96m
GREEN       = \033[0;92m
BLUE        = \033[0;94m
RED         = \033[0;91m


all: build

build:
	@echo "Setting up ft_transcendence..."
	@bash ./scripts/setup.sh
	@bash ./scripts/generate_certs.sh
	@echo "Building and starting containers..."
	@COMPOSE_BAKE=true docker compose --env-file ./containers/.env -f ./containers/docker-compose.yml -f ./containers/docker-compose.tunnel.yml up -d --build
	@echo "$(GREEN)ft_transcendence is ready!$(DEF_COLOR)"
	@echo "$(YELLOW)Run 'make tunnel' in another terminal to expose it publicly"
	@echo "$(BLUE)Local access: http://localhost:8080$(DEF_COLOR)"

prod: build
dev: build

tunnel:
	@echo "Setting up public tunnel..."
	@if ! ls cloudflared >/dev/null 2>&1; then \
		echo "Downloading cloudflared..."; \
		ARCH=$$(uname -m); \
		OS=$$(uname -s | tr '[:upper:]' '[:lower:]'); \
		if [ "$$OS" = "linux" ]; then \
			if [ "$$ARCH" = "x86_64" ]; then \
				URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64"; \
			elif [ "$$ARCH" = "aarch64" ]; then \
				URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64"; \
			else \
				echo "Unsupported architecture: $$ARCH"; exit 1; \
			fi; \
			curl -L "$$URL" -o ./cloudflared; \
			chmod +x ./cloudflared; \
		elif [ "$$OS" = "darwin" ]; then \
			if [ "$$ARCH" = "x86_64" ]; then \
				URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-amd64.tgz"; \
			elif [ "$$ARCH" = "arm64" ]; then \
				URL="https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-darwin-arm64.tgz"; \
			else \
				echo "Unsupported architecture: $$ARCH"; exit 1; \
			fi; \
			curl -L "$$URL" -o ./cloudflared.tgz; \
			tar -xvzf ./cloudflared.tgz; \
			chmod +x ./cloudflared; \
			rm ./cloudflared.tgz; \
		else \
			echo "Unsupported OS: $$OS"; exit 1; \
		fi; \
		echo "cloudflared installed"; \
	fi
	@echo "Starting tunnel on http://localhost:8080"
	@echo "Keep this terminal open to maintain the tunnel"
	./cloudflared tunnel --url http://localhost:8080 --http-host-header localhost --no-tls-verify

rebuild:
	$(MAKE) stop
	$(MAKE) clean
	$(MAKE) build

stop:
	@echo "Stopping all containers..."
	@docker stop $$(docker ps -aq) 2>/dev/null || true
	@docker rm $$(docker ps -aq) 2>/dev/null || true
	@echo "All containers stopped"

clean:
	@echo "Cleaning up..."
	@docker compose -f ./containers/docker-compose.yml down --remove-orphans 2>/dev/null || true
	@docker system prune -f --volumes
	@rm -f containers/.env
	@rm -rf containers/nginx/ssl
	@echo "Cleanup complete"

fclean:
	@echo "This will remove all containers, images, and volumes!"
	@read -p "Are you sure? You will lose the database. [y/N]: " confirm && [ "$$confirm" = "y" ] || exit 1
	$(MAKE) stop
	@docker compose -f ./containers/docker-compose.yml down --remove-orphans --rmi all --volumes 2>/dev/null || true
	@docker volume prune -f
	@docker network prune -f
	@docker image prune -a -f
	@echo "Deep clean complete"

nuke:
	@echo "NUCLEAR OPTION: This will destroy ALL Docker data on your system!"
	@read -p "This will remove ALL containers, images, volumes, networks, etc. Are you absolutely sure? [y/N]: " confirm && [ "$$confirm" = "y" ] || exit 1
	@echo "Nuking everything in 3 seconds... Press Ctrl+C to abort!"
	@sleep 3
	-@docker stop $$(docker ps -aq) 2>/dev/null
	-@docker rm -f $$(docker ps -aq) 2>/dev/null
	-@docker rmi -f $$(docker images -aq) 2>/dev/null
	-@docker volume rm $$(docker volume ls -q) 2>/dev/null
	-@docker network rm $$(docker network ls | grep -v "bridge\|host\|none" | awk '{print $$1}') 2>/dev/null
	-@docker builder prune -af
	-@docker system prune -af --volumes
	@echo "Nuclear cleanup complete - Docker is now pristine"

status:
	@echo "Container Status:"
	@docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

help:
	@echo "🎮 ft_transcendence Quick Commands:"
	@echo ""
	@echo "  make              - Build and start everything (recommended)"
	@echo "  make tunnel       - Start public tunnel (run in separate terminal)"
	@echo "  make status       - Show running containers"
	@echo "  make stop         - Stop all containers"
	@echo "  make clean        - Clean up (keeps database)"
	@echo "  make rebuild      - Full rebuild"
	@echo "  make fclean       - Deep clean (removes database)"
	@echo "  make nuke         - Nuclear option (removes ALL Docker data)"
	@echo ""
	@echo "Quick start: Run 'make' then 'make tunnel' in another terminal"

.PHONY: all build dev prod tunnel rebuild stop clean fclean nuke status help
