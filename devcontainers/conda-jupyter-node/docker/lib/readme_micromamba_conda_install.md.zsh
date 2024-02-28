#!/usr/bin/env zsh
set -euxo pipefail

# copied
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

cd $HOME
# mkdir -p $HOME/bin
# curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest
# https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html#linux-and-macos
# apt update # needed bzip2
# apt install -y bzip2
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
# curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C bin/micromamba
eval "$(./bin/micromamba shell hook -s posix)"
# assuming zsh... should maybe should change that
./bin/micromamba shell init -s zsh -p ~/micromamba
source ~/.zshrc
alias conda=micromamba

# set default
micromamba config append channels conda-forge
micromamba config set channel_priority strict

# this might not work... because it might create a new shell
# right... that's why i think the instructions told us to use the bin
micromamba activate  # this activates the base environment
micromamba create -y --name 311 python=3.11 pipx poetry
micromamba activate 311

conda install -y jupyterlab nodejs

# conda env export --no-prefix > environment.yml
# conda env export > environment.yml
# conda env export
conda env export --from-history
# node --version
# this is going to take a bit of time to try...

# should check if it set
exit 0
/webapp/tests/smoke-test-0.sh
./lib/readme_micromamba_conda_install.md.zsh
###### jupyter lab --no-browser
jupyter lab
jupyter lab --no-browser
jupyter lab --no-browser --allow-root


# figure out later
# jupyter lab --no-browser --allow-root --no-token
jupyter lab --help-all |grep -i token
jupyter lab --help-all |grep -i no
jupyter lab --help-all |grep -i pass
jupyter lab --help-all |grep -i auth

### conda aliased
conda env list
# use port forward
# localhost:8888
# by attaching if forgot
file:///root/.local/share/jupyter/runtime/jpserver-4201-open.html