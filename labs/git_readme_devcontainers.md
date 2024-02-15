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