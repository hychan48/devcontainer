# Hychan48's Dev Container
VSCode Docker Dev Container

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

# submodule name
rmdir -force test
git.exe reset --hard
git.exe status

# this is one time
git submodule update --init --recursive

# this updates? dont run these
git submodule update --remote --merge
```