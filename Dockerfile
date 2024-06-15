# Use the official Alpine image as a base
FROM alpine:latest

# Install necessary packages: tailscale, openrc, and bash
RUN apk update && \
    apk add --no-cache tailscale openrc bash

# Enable and start openrc
RUN rc-update add tailscaled default

# Create the entrypoint script
RUN echo '#!/bin/bash\n\
rc-status\n\
touch /run/openrc/softlevel\n\
rc-service tailscaled start\n\
tailscale up --authkey=${TAILSCALE_AUTH_KEY} ${TAILSCALE_OPTS}\n' \
> /entrypoint.sh && \
chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 41641/udp 10000-65535/udp

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
