#!/bin/bash

echo "Setting up ft_transcendence environment..."

# Generate secure secrets
JWT_SECRET=$(openssl rand -hex 32)
JWT_REFRESH_SECRET=$(openssl rand -hex 32)
SESSION_SECRET=$(openssl rand -hex 32)

# Generate Grafana admin password
PASSWORD=$(LC_ALL=C tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 20)
if ! [[ "$PASSWORD" =~ [A-Z] ]] || ! [[ "$PASSWORD" =~ [a-z] ]] || ! [[ "$PASSWORD" =~ [0-9] ]]; then
  PASSWORD=$(echo "${PASSWORD:0:17}A1z")
fi

# Create environment file
cat > containers/.env << EOF
JWT_SECRET='${JWT_SECRET}'
JWT_REFRESH_SECRET='${JWT_REFRESH_SECRET}'
JWT_EXPIRES_IN='7d'

ADMIN_EMAIL='ft.transcendence.42.pong@gmail.com'

# Database configuration
DB_PATH='/usr/src/app/db/mydatabase.db'

# Blockchain configuration (for evaluation)
BLOCKCHAIN_PRIVATE_KEY=f7e2e781445f041877efab5a1c66d66163a51242e6407e05ce1d6137cbf36a1a
AVALANCHE_RPC_URL=https://api.avax-test.network/ext/c/C/rpc

# Redis configuration
REDIS_URL=redis://redis:6379

# Session configuration
SESSION_SECRET='${SESSION_SECRET}'

# Grafana configuration
GRAFANA_ADMIN_PASSWORD='${PASSWORD}'

# Development mode
NODE_ENV=development
EOF

echo "✓ Environment configured"
echo "✓ Grafana admin password: ${PASSWORD}"
echo "✓ Ready to build!"
