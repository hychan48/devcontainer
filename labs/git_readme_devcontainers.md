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
devcontainer up --workspace-folder .
devcontainer up --workspace-folder ./.devcontainer
```

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