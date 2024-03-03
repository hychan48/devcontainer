#!/usr/bin/env bash
# set -euxo pipefail
# set -x

# Checks if packages are installed and installs them if not
check_packages() {
	if ! dpkg -s "$@" >/dev/null 2>&1; then
		if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
			echo "Running apt-get update..."
			apt-get update -y
		fi
		apt-get -y install --no-install-recommends "$@"
	fi
}

# Check Packages
log_packages() {
  echo "Checking for packages: $@"
  for package in "$@"; do
    # if not in whence which command type?
    if which "$package" > /dev/null 2>&1 ; then
      # echo green text to stdout
      echo -e "Package \e[32m$package\e[0m is in path" "\xE2\x9C\x94""\xE2\x9C\x94"
    elif ! dpkg -s "$package" >/dev/null 2>&1; then
    # echo red text to stdout
      echo -e "Package \e[31m$package\e[0m is not installed"
      # echo -e "Package \e[31m$package\e[0m is not installed" >&2
      # echo "Package $package is not installed"
    else
      echo -e "Package \e[32m$package\e[0m is installed" "\xE2\x9C\x94"
    fi
  done
}
log_packages tar curl bzip2 micromamba python pip pipx jupyter node
exit 0
#########
./tests/smoke-test-0.sh
# debug works well:
log_packages git ca-certificates zsh wget

