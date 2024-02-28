# Useful stuff
* should have the command to download these two files
* and run
* `check_packages`
  * it's legit
  * it checks the lists before doing apt update
  * but it should probably clean up after itself being inside of a docker

## zsh plugins
* https://github.com/zsh-users?q=&type=all&language=&sort=
  * omz plugins are here
* plugins are the official ones?
  * https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

# Check Shell
```bash
cat /etc/shells
printenv SHELL
echo $SHELL
getent passwd $USER | cut -d: -f7
getent passwd $USER | cut -d: -f7 | head -n 1 # probably most accurate one
getent passwd $USER |grep -i zsh #aaaa 
getent passwd $USER | head -n 1 | cut -d: -f7 # this ? unless it's different shoudl try
# after set
SHELL=/usr/bin/zsh
chsh -s $(which zsh)
chsh -s /usr/bin/zsh
# set -x is to print each command. set +x
set +x
echo chsh -s $(which zsh)
set -x ; chsh -s $(which zsh)
ps -p $$ #
# interesting
# install ps
apt install procps
sudo apt-get update && apt-get install -y procps

# optional installs
# or i should have slim and non slim?
# feels more liek a packer thing here
```

# todo
* [ ] add sudo
* [ ] rsync?

# Schema here
```jsonc
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
```
```bash
#!/usr/bin/env bash
# my install and experiment
# check envs
printenv USERNAME
printenv $_REMOTE_USER
printenv _REMOTE_USER
printenv USER
echo $USER

export USERNAME=${USERNAME:-root}
printenv USERNAME
unset USERNAME

```