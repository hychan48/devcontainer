#!/usr/bin/env bash
## note entry points run everytime the container starts
set -euxo pipefail
USER=${USERNAME:-root}
cat /etc/os-release | grep ID # ID=debian
printenv | grep -i home
getent passwd $USER | head -n 1 | cut -d: -f7 # check which is the default shell
getent passwd $USER | head -n 1 | cut -d: -f7 | grep -i zsh
printenv SHELL | grep -i zsh


exec "$@"
