# Hychan48's Dev Container
* Under Construction
* [Docker Quick Notes](https://codeforwings.github.io/vite-press-docs/ddocs_docker/docs_readme_docker.html#docker-quick-notes)
## Tasks
- [ ] Common Dev Dependencies
  * might've been done from devcontainer
- [x] OMZ ZSH Shell
  - [x] Aliases
  - [x] Plugins
- [ ] Git
  - [x] Git config is passed over. just need to be careful of some of the configs
- [ ] SSH Keys and Secrets
  - [x] Dev container auto mounts ssh-agent
  - [ ] SSH Config

- [ ] VSCode Extensions and Settings
- [ ] Packer / WSL Docker
## up down
* [labs/git_readme_devcontainers.md](labs/git_readme_devcontainers.md)
* [.devcontainer/Dockerfile](.devcontainer/Dockerfile)
* [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json)
```bash
#!pwsh.exe
pnpm add -g @devcontainers/cli
git submodule update --init --recursive # have to do this before the container starts
# might want to add some git stuff to the container

devcontainer build --workspace-folder . --image-name jchan48h/devcontainer:dev
devcontainer up --id-label name=val --workspace-folder . --remove-existing-container # force and no detach...
devcontainer exec --id-label name=val --workspace-folder . "zsh"
# todo launch / attach... need command for that. and fix the container

git config --global --add safe.directory /workspaces/devcontainer

git submodule init
git submodule update
git-submodule --help

git config --global --list

git submodule deinit test/bats
git submodule deinit -f test/bats
git submodule deinit -f test/test_helper/bats-assert
git submodule deinit -f test/test_helper/bats-support

# can't do this in the devcontainer
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert

git clone --recurse-submodules <repository-url>
# if cloned already
git submodule update --init
## or
git submodule update --init --recursive

git config --global core.filemode false
git config --global core.filemode
```
# Exists
* [x] Rsync
* [x] wget
* [x] curl
* [x] ssh
* [x] git
* [x] python3
* [ ] network
  * [x] ifconfig
  * [x] ip
* [ ] node
* [ ] pipx
* [ ] nginx
* [ ] sshd
* [ ] sudo -e
* [ ] tmux
  * screen
* [ ] systemctl (negative...)
* other cat
* wsl seems beter tbh


## Backlog
* $profile
* ahk / other key bindings
* wsl
  * xeyes / gui
* other ssh stuff like config

## VSCode Docker Dev Container
* https://hub.docker.com/repository/docker/jchan48h/deb-network/general
  * old one
* try Packer?

## push fixme / test
* use f1 to launch devcontainer to try?






```txt
.
├── .devcontainer
│   ├── devcontainer.json
│   └── Dockerfile
├── .vscode
│   ├── extensions.json
│   └── settings.json
├── src
│   └── ...
└── README.md
```

## Generate tree
```bash
mkdir -p .devcontainer
code .devcontainer/devcontainer.json
code .devcontainer/Dockerfile
# cygwin in the wrong place...

# F1 command
docker build --pull --rm -f ".devcontainer\Dockerfile" -t devcontainer:latest ".devcontainer"
docker container ls --all


docker run -it --rm devcontainer:latest ".devcontainer" --name dc --hostname dc ".devcontainer"

docker image ls
 ## oh did i use my debian.,, why is it installing docker


# add docker profiles
## should add some bash / powershell aliases
# macro deck?

docker image ls | grep container

docker run -d devcontainer:latest
docker run -d --name devcontainer-0 devcontainer:latest bash
docker rm devcontainer-0 -f
docker start devcontainer-0

docker container ls
docker container ls --all


docker container prune -f

docker container ls
```

* https://code.visualstudio.com/docs/devcontainers/containers
* https://containers.dev/implementors/json_reference/
* there's a wizard... devcontainer add
* 

# File locations
```jsonc
{

  // "git.path": "C:\\Program Files\\Git\\cmd\\git.exe",
  "git.path": "C:\\Program Files\\Git\\cmd\\git.exe",
    "liveServer.settings.AdvanceCustomBrowserCmdLine": "",
    // "remote.SSH.path": "C:\\cygwin64\\bin\\ssh.exe"
    // "remote.SSH.path": "C:\\Program Files\\OpenSSH-Win64\\ssh.exe",
        "remote.SSH.path": "c:/progra~1/Git/cmd/git.exe",
        "remote.SSH.path": "C:\\Program Files\\OpenSSH-Win64\\sshd.exe",

}

```


```
Could not connect to ssh-agent on local host (\\.\pipe\openssh-ssh-agent). Make sure the service is running.
```

* i should probably use root instead? makes things easier
* devcontainer has pandoc


## Plugins of Interest
* plugin isnt a bad idea
* and/or searcher
* https://containers.dev/features
```
ghcr.io/mamba-org/devcontainer-features/micromamba:1
```
# Links
* https://codeforwings.github.io/vite-press-docs/
* https://github.com/hychan48/devcontainer/tree/4-dockerhub-jchan48hdeb-network
* https://hub.docker.com/


# Docker Run
```bash
# hychan48 -> jchan48h
docker pull jchan48h/devcontainer:latest
# docker run -it --rm --name devcontainer -v $(pwd):/home/devcontainer/project jchan48h/devcontainer:latest

```

## On new User
```bash
# non docker

```


# Git submodule bats
* checkout issue debug
```powershell
# Run this on a new pull?
git submodule init

git config --global --add safe.directory /workspaces/devcontainer
git config --global auto.crlf input # this one is fake
git config --global core.autocrlf input # this one...

# submodule name
rmdir -force test
git.exe reset --hard
git.exe status

# this is one time
git submodule update --init --recursive

# this updates? dont run these
git submodule update --remote --merge
```
