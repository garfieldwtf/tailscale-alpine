# Use the official Alpine image as a base
FROM alpine:latest

# Install necessary packages: tailscale, openrc, and bash in a single layer
RUN apk update && apk add --no-cache tailscale openrc bash && rc-update add tailscale default 

# Copy the entrypoint script and set permissions in one layer
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 41641/udp 10000-65535/udp

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
