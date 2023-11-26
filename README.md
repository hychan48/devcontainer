# devcontainer
VSCode Docker Dev Container


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