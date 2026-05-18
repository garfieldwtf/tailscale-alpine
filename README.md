# Tailscale Alpine

Docker image combining Tailscale VPN and Alpine Linux for secure, lightweight networking.

## Overview

This repository provides a Dockerfile-based solution to create a minimal Docker image with Tailscale VPN pre-installed on Alpine Linux. Perfect for creating secure, private networks and remote access solutions with minimal resource overhead.

## Features

- **Lightweight Base** - Built on Alpine Linux for minimal image size
- **Tailscale Integration** - Pre-configured Tailscale VPN client
- **Docker Ready** - Simple Docker image for easy deployment
- **Secure Networking** - Leverage Tailscale's encrypted mesh VPN
- **Easy Deployment** - Quick container startup and configuration
- **Low Resource Usage** - Minimal CPU and memory requirements

## Language Composition

- **Dockerfile** - 76.5%
- **Shell** - 23.5%

## Getting Started

### Prerequisites

- Docker installed
- Docker Hub or container registry access
- Tailscale account

### Building the Image

1. Clone the repository:
   ```bash
   git clone https://github.com/garfieldwtf/tailscale-alpine.git
   cd tailscale-alpine
   ```

2. Build the Docker image:
   ```bash
   docker build -t tailscale-alpine:latest .
   ```

### Running the Container

1. Start the container:
   ```bash
   docker run -d \
     --name tailscale \
     --cap-add=NET_ADMIN \
     --cap-add=SYS_MODULE \
     -v /dev/net/tun:/dev/net/tun \
     tailscale-alpine:latest
   ```

2. Authenticate with Tailscale:
   ```bash
   docker exec tailscale tailscale login
   ```

3. Follow the authentication link to complete setup

### Docker Compose

Alternatively, use Docker Compose:

```yaml
version: '3.8'

services:
  tailscale:
    build: .
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    devices:
      - /dev/net/tun:/dev/net/tun
    volumes:
      - tailscale-state:/var/lib/tailscale
    restart: unless-stopped

volumes:
  tailscale-state:
```

## Use Cases

- **Remote Access** - Secure access to private resources
- **VPN Gateway** - Create a VPN gateway for services
- **Private Mesh Networks** - Build secure mesh networks
- **Container Networking** - Private networking between containers
- **Development Environments** - Secure development infrastructure

## Configuration

Environment variables and mount points can be customized:

- **TUN Device** - Required for VPN functionality
- **Tailscale State** - Persist authentication and configuration
- **Network Capabilities** - NET_ADMIN and SYS_MODULE capabilities required

## Contributing

Contributions are welcome! Feel free to:

- Report issues
- Suggest improvements
- Submit pull requests with enhancements

## License

This project is open source and available for use and modification.

## Support

For issues, questions, or suggestions, please open an issue on the [GitHub repository](https://github.com/garfieldwtf/tailscale-alpine).

---

Built with ❤️ for secure Alpine Linux networking
