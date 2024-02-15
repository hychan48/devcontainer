#!/usr/bin/env bash
# append-zsh-alias.sh#KEY
# should be part of .zshrc and .bashrc
# .bash_alias.cy.sh
# probably should figure out proper folder struct
# and naming conventions
# https://codeforwings.github.io/vite-press-docs/posix/docs_bash.html#install-oh-my-zsh
PROMPT="$USERNAME@`hostname`%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)' 

export TERM=xterm-256color || export TERM=xterm 

# alias cockpit-start-alias="tmux new-session -d -s cockpit-wsinstance 'runuser -u cockpit-wsinstance -- /usr/lib/cockpit/cockpit-ws --no-tls --local-session BRIDGE'"

# alias _='sudo '
# alias rsync='rsync -e "/bin/ssh.exe"'
alias df='df -h'
alias du='du -h'
alias dmesg='dmesg -T'
# alias apt-install='/cygdrive/g/HyperVImages/utils/setup-x86_64.exe'
# alias start='/cygdrive/c/Windows/explorer.exe'
alias jc-code='code -r' #open in current window
alias jc-find-files='find . -type f -name'
alias gcm='git fetch origin;git checkout main;git fetch origin --prune'
alias crlfGit='git config --global core.autocrlf input'
alias cdd="cd `git rev-parse --show-toplevel`"

# true is for crossplatform...
# need to verify this one:
# careful running this one... should skip certain files or focus on certain files
# like .sh etc. because it can break... it shouldnt do recurse i feel either
# alias fixcrlf="find . -type f -exec sed -i 's/\r$//' {} \;"
# alias crlfRm='find . -type f -exec sed -i \'s/\r$//\' {} \;'
# remember VSCode can add to path
# TERM=xterm-256color + tmux

function jc-findFiles {
  local filename=$1 # must be double quoted
  local directory=${2:-"."}
  find $directory -type f -name $filename \
  -not \( -path "./node_modules/*" -prune \) \
  -not \( -path "*/.*" -prune \)
}
function jc-chmod-shells {
  local filename=${2:-"*.sh"}
  local directory=${2:-"."}
  find $directory -type f -name $filename -not \( -path "./node_modules/*" -prune \) \
  -not \( -path "*/.*" -prune \) \
  -exec echo {} \; \
  -exec chmod +x {} \;
}
function jc-gh-chmod-shells {
  local filename=${2:-"*.sh"}
  local directory=${2:-"."}
  find $directory -type f -name $filename -not \( -path "./node_modules/*" -prune \) \
  -not \( -path "*/.*" -prune \) \
  -exec git update-index --chmod=+x {} \; \
  -exec chmod +x {} \;
}
## dircolors -b > ~/.bash_dircolors.cy.sh

# exit/return
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # echo "Script is being executed"
    exit 0
else
    # echo "Script is being sourced"
    return 0
fi
