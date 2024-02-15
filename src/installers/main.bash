#!/usr/bin/env bash
# main.bats
# for apt systems... expects root
# get timedatectl current timezone
set -euxo pipefail
apt-get update && apt-get install -y \
  rsync \
  sshpass \
  openssh-server \
  git \
  sudo \
  iputils-* \
  net-tools \
  iproute2 \
  dnsutils \
  nmap \
  ncat \
  tmux \
  zsh \
  curl \
  tree \
  nano \
  && rm -rf /var/lib/apt/lists/* \
  ;
# if TZ is not set
test -z "${TZ}" ]] && timedatectl set-timezone America/Toronto # improve
# test -e /usr/bin/timedatectl  && timedatectl set-timezone America/Toronto # improve
exit 0
timedatectl | grep -i 'time zone'
timedatectl -p "Time zone"
timedatectl --value TZ
timedatectl --help
timedatectl list-timezones | grep -i 'america'


