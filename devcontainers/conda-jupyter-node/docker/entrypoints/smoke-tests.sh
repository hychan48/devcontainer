#!/usr/bin/env bash
set -euxo pipefail
echo /etc/os-release
printenv | grep -i home
# doesn't need to be bash even
# using healthcheck as well