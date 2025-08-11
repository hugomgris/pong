# 🎮 ft_transcendence - Quick Start Guide

## 🚀 Simple Setup (Recommended)

The easiest way to get ft_transcendence running with public tunnel access:

### 1. Build and Start
```bash
make
```
This will:
- ✅ Generate secure environment variables
- ✅ Create SSL certificates
- ✅ Build and start all containers
- ✅ Set up the application on http://localhost:8080

### 2. Enable Public Access (Optional)
In a **separate terminal**:
```bash
make tunnel
```
This will:
- 📦 Download cloudflared automatically (if needed)
- 🌐 Create a public tunnel to your local instance
- 🔗 Give you a public URL to share

## 🎯 Available Commands

| Command | Description |
|---------|-------------|
| `make` | Build and start everything (default) |
| `make tunnel` | Start public tunnel (separate terminal) |
| `make status` | Show running containers |
| `make stop` | Stop all containers |
| `make clean` | Clean up (keeps database) |
| `make rebuild` | Full rebuild from scratch |
| `make help` | Show all available commands |

## 🔧 Advanced Options

- `make fclean` - Deep clean (removes database)
- `make nuke` - Nuclear option (removes ALL Docker data)

## 📡 Access Points

- **Local**: http://localhost:8080
- **Public**: Use `make tunnel` to get a public URL
- **Monitoring**: 
  - Grafana: http://localhost:3001
  - Prometheus: http://localhost:9090
  - Adminer: http://localhost:1090

## 💡 Pro Tips

1. **First time?** Just run `make` and then `make tunnel`
2. **Development?** The setup includes hot reload for frontend changes
3. **Sharing?** The tunnel URL is perfect for sharing with others
4. **Stuck?** Try `make clean && make` to rebuild

That's it! 🎉
