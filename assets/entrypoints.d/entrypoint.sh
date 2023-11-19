#!/usr/bin/env bash
# !/bin/sh
# 1. assumes /sbin/sshd -D as cmd
# 2. will run cockpit
set -euxo pipefail
# echo "Running entrypoint.sh"
# rm -rf /etc/cockpit/disallowed-users # empty on ubuntu

# quick and dirty cockpit
# tmux new-session -d -s cockpit-wsinstance 'runuser -u cockpit-wsinstance -- /usr/lib/cockpit/cockpit-ws --no-tls --local-session BRIDGE'
# export SHELL=/bin/zsh
ln -s /app/test/bats/bin/bats /usr/bin/bats
exec "$@"

service ssh start
# /usr/bin/bats seems to be the best...
ln -s /app/test/bats/bin/bats /usr/local/bin/bats
ls -l /usr/local/bin/bats
ls -l /usr/bin/bats
# System has not been booted with systemd as init system (PID 1). Can't operate.
# 