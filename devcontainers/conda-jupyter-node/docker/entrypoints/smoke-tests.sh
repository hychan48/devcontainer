#!/usr/bin/env bash
## note entry points run everytime the container starts
set -euxo pipefail
# LOGNAME=root
# USER=${USERNAME:LOGNAME:-root}
USER=${USERNAME:-root}
# USER=${LOGNAM:-root}
cat /etc/os-release | grep ID # ID=debian
printenv | grep -i home
getent passwd $USER | head -n 1 | cut -d: -f7 # check which is the default shell
getent passwd $USER | head -n 1 | cut -d: -f7 | grep -i zsh
printenv SHELL | grep -i zsh
# doesn't need to be bash even
# using healthcheck as well
# lib/readme_zsh_plugin_copy.md.sh

exec "$@"
