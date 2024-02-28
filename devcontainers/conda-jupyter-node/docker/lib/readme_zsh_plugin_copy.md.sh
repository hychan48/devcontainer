#!/usr/bin/env bash
# https://github.com/devcontainers-contrib/features/blob/main/src/zsh-plugins/install.sh
# https://github.com/devcontainers-contrib/features/tree/main/src/zsh-plugins
# using their plugin's sh... interesting
# isn't it user?
# or use $HOME? lol
# LOGNAME=root
# hardcodign root for now as default
# author is using it for finding home directory.. w/e
export USERNAME=${USERNAME:-root}
# space seperated ones to add to ~/.zshrc
# export PLUGINS="ssh-agent npm"
## the plugins didnt get added... as expected...
#  https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
# git is defaulted
export PLUGINS="ssh-agent npm zsh-autosuggestions zsh-syntax-highlighting zsh-completions python docker docker-compose gh yarn node"
# export PLUGINS="${PLUGINS} rsync dotenv"
# if ID is debian append debian to plugins
if [ -f /etc/os-release ]; then
  if cat /etc/os-release | grep ID | grep debian; then
    export PLUGINS="${PLUGINS} debian"
  elif cat /etc/os-release | grep ID | grep ubuntu; then
    export PLUGINS="${PLUGINS} ubuntu"
  fi
fi
# export PLUGINS="${PLUGINS} rsync "

# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/composer
# might be useful
# need to add rsync
# ones to git clone into ~/.oh-my-zsh/custom/plugins
# https://github.com/zsh-users?q=&type=all&language=&sort=
# should write a quick parser for this
export OMZPLUGINS="https://github.com/zsh-users/zsh-autosuggestions https://github.com/zsh-users/zsh-syntax-highlighting https://github.com/zsh-users/zsh-completions"
# wonder if they they need to be repeated?
# get current script directory
current_script_path="$(cd "$(dirname "$0")" && pwd)/$(basename "$0")"
script_directory="$(dirname "$current_script_path")"
# test if ~/.ssh exists and if not create it
if [ ! -d ~/.ssh ]; then
  # for the ssh-agent plugin
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
fi
# should check zsh / chsh before continue
chsh -s /usr/bin/zsh
# Run
$script_directory/zsh-plugins-install.copy.sh

# source again
# https://codeforwings.github.io/vite-press-docs/posix/docs_readme_bash.html#zshrc
echo 'PROMPT="$USERNAME@`hostname`%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} "' >> ~/.zshrc

if [ $(tput colors) == "256" ]; then
  # maybe i should check before doing so. and add my own little snippet
  echo 'export TERM=xterm-256color' >> ~/.zshrc
fi
source ~/.zshrc
exit 0
#####
lib/readme_zsh_plugin_copy.md.sh

# debug plugins
cat ~/.zshrc | grep plugins


###
pwd
./lib/readme_zsh_plugin_copy.md.sh
bash ./lib/readme_zsh_plugin_copy.md.sh
tree -A ./lib
chmod +x ./lib/readme_zsh_plugin_copy.md.sh
git update-index --chmod=+x ./lib/readme_zsh_plugin_copy.md.sh
# Schema here
: 
{
  "name": "ZSH Plugins",
  "id": "zsh-plugins",
  "version": "0.0.4",
  "description": "Install (Oh-My-)ZSH plugins",
  "documentationURL": "http://github.com/devcontainers-contrib/features/tree/main/src/zsh-plugins",
  "installsAfter": [
    "ghcr.io/devcontainers/features/common-utils",
    "ghcr.io/devcontainers/features/git"
  ],
  "options": {
    "plugins": {
      "type": "string",
      "default": "",
      "proposals": [
        "ssh-agent npm"
      ],
      "description": "Space separated list of ZSH plugin names that will be added to .zshrc"
    },
    "omzPlugins": {
      "type": "string",
      "default": "",
      "proposals": [
        "https://github.com/zsh-users/zsh-autosuggestions"
      ],
      "description": "Space separated list of Oh-My-ZSH custom plugin Git URLs that will be cloned"
    },
    "username": {
      "type": "string",
      "default": "",
      "proposals": [
        "root",
        "node",
        "vscode"
      ],
      "description": "For which user to setup ZSH plugins, by default uses 'remoteUser' or 'containerUser' from config"
    }
  }
}
# end
