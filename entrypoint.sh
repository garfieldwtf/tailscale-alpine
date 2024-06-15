#!/bin/bash
rc-status
touch /run/openrc/softlevel
rc-service tailscaled start
tailscale up --authkey=${TAILSCALE_AUTH_KEY} ${TAILSCALE_OPTS}
