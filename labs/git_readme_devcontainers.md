# Commands
## Files
```bash
tree .devcontainer .vscode
code .devcontainer/devcontainer.json\
[devcontainers.reference](https://containers.dev/implementors/json_reference/)
[devcontainers.Dockerfile](https://containers.dev/guide/dockerfile)
[devcontainers.features](https://containers.dev/features)
```
```bash
pnpm add -g @devcontainers/cli
# https://containers.dev/guide/prebuild
# devcontainer build --workspace-folder . --push true --image-name <my_image_name>:<optional_image_version
docker image prune -f
docker container prune -f
devcontainer --help
devcontainer build --help
devcontainer build --workspace-folder . --image-name jchan48h/devcontainer:dev
docker container stop $(docker container ls -aq) # stop all containers
docker container prune -f # remove all containers

devcontainer up --help
devcontainer up --workspace-folder .
devcontainer up --id-label name=val --workspace-folder . 
#------
# have to ctrl c... to get out
devcontainer up --id-label name=val --workspace-folder . --remove-existing-container # force
docker exec -it $(docker ps -q) 
devcontainer exec --help
# oh taht's what -label-id is for
# re-eventing the wheel
devcontainer exec --id-label name=val --workspace-folder . "zsh"
cat /home/vscode/hello.txt
sudo cat /root/hello.txt
exit 

# devcontainer down --help # doesnt exist
# devcontainer set-up # setup as 
```
```bash

* todo - make a devcontainer for showing commands jupyter like
## build
* --workspace-folder .
* --config expects `.devcontainer/devcontainer.json`
```bash
#!pwsh.exe
devcontainer build --workspace-folder . --image-name jchan48h/devcontainer:dev

devcontainer build --workspace-folder . --image-name jchan48h/devcontainer:dev --push true

docker push jchan48h/devcontainer:dev


```
## up
```bash
#!pwsh.exe
devcontainer up --workspace-folder .

```
### Fast Devcontainer Build
```bash
# faster to not run the devcontainer with vscode when testing
docker image prune -f
devcontainer build --workspace-folder . --image-name jchan48h/devcontainer:dev
# same hash build and up... which make sit easy to find i guess
# too many danglign iamges wth
devcontainer up --workspace-folder .
# devcontainer up with name

docker run -it --rm jchan48h/devcontainer:dev
# check shell
tree /workspace
./test/tests/smoke.bats
uname -a
# ohh it didnt mount?
exit

```
```bash
# duplicate vscode project in new window
code --new-window .

```
## Features

# Git and VS Code Dev Containers
- "name" - Specifies a display name for the dev container.

- "image" - Defines the base Docker image to use for the container.

- "postCreateCommand" - Shell commands to run after the container is created. Often used to install additional tools.

- "settings" - Configures VS Code settings to use in the container, like the shell.

- "extensions" - Lists any VS Code extensions to install in the container.

- "onCreateCommand" - Shell command to run when container first starts.

- "appPort" - Port number to expose for web app access.

- "remoteUser" - Username for the container if not wanting to run as root.

- "mounts" - To mount local filesystem directories into the container.

- "runArgs" - Lets you pass extra args to the docker run command.

- "forwardPorts" - For forwarding additional ports from container to local.

- "postStartCommand" - Script to run every time after the container starts.

- "overrideCommand" - Replaces default container entrypoint/command.

```jsonc
{

  "name": "Fedora",

  "image": "fedora:latest",

  "postCreateCommand": "dnf install -y git bash-completion findutils",

  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash"
  },

  "extensions": [
    "username.extension"
  ],

  "onCreateCommand": "/usr/bin/bash"
}

```

```jsonc
{
  "name": "Alpine",
  
  "image": "alpine:latest",
  
  "postCreateCommand": "apk add --no-cache git openssh-client bash",
  
  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash"
  },

  "extensions": [
    "username.extension"
  ],

  "onCreateCommand": "/bin/bash"
}
```

# interesting...
```jsonc
{
  "name": "Debian",
  
  "image": "debian:latest",
   
  // Install helpers 
  "postCreateCommand": "apt-get update && apt-get install -y git build-essential procps",
  
  "extensions": [
    "username.extension"
  ],

  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash"
  },

  "onCreateCommand": "/usr/bin/bash"
}

```