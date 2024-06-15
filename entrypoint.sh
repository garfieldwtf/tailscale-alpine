#!/bin/bash
rc-status
touch /run/openrc/softlevel
rc-service tailscale start
tailscale up --authkey=${TAILSCALE_AUTH_KEY} ${TAILSCALE_OPTS}
/bin/sh 
