# Hychan48's Dev Container
VSCode Docker Dev Container
* [labs/git_readme_devcontainers.md](./labs/git_readme_devcontainers.md)
# Links
* https://codeforwings.github.io/vite-press-docs/
* https://github.com/hychan48/devcontainer/tree/4-dockerhub-jchan48hdeb-network
* https://hub.docker.com/


# Docs
* https://docs.docker.com/engine/install/
* https://bats-core.readthedocs.io/en/stable/installation.html


## First Time Setup - Dev
### Requirements
* Docker
* git
## Env
* Debian 12

* using vites makes a lot more sense?
```bash
#!/bin/sh
git submodule update --init --recursive

chmod +x ./src/installers/**.sh
chmod +x ./src/installers/**.bash
chmod +x ./src/scripts/**.bash
chmod +x ./test/installers/**.bats
chmod +x ./assets/entrypoints.d/**.sh
```

# Todo
* add linux_general etc.

# Docker Build and tag
```bash
docker login --username=jchan48h

docker image prune -f
docker network prune -f
docker container prune -f
docker build --help

# Build
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . )
docker tag docker-test:dev jchan48h/docker-test:latest
docker push jchan48h/docker-test:latest
docker image ls

# zsh dev run
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . && docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm $N:dev zsh)

## run only and mount zsh
(F=./dockers/docker-test/;N="docker-test"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm $N:dev zsh)
## smoke - dont mount app
(F=./dockers/docker-test/;N="docker-test"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -w "/app" --hostname $N --rm $N:dev zsh)
./test/bats/bin/bats ./test/installers/main.bats
./test/installers/main.bats
# ./test/bats/bin/bats ./test/installers/smoke.bats
# ./test/bats/bin/bats ./test/installers/smoke.bats


```
# OMZ Only
```bash
docker pull buildpack-deps:bookworm # 12
# omz test - bash exec
(N="buildpack-deps"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm $N:bookworm bash)
(N="buildpack-deps"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm --entrypoint ./assets/entrypoints.d/entrypoint.sh $N:bookworm bash)
(N="buildpack-deps"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm --entrypoint ./assets/entrypoints.d/entrypoint.sh $N:bookworm ./src/setup/profile-config.bash)

# omz
(N="buildpack-deps"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm --entrypoint ./assets/entrypoints.d/entrypoint.sh $N:bookworm ./test/installers/main.bats)

(N="buildpack-deps"; docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm --entrypoint ./assets/entrypoints.d/entrypoint.sh $N:bookworm ./test/installers/main.bats)
./test/bats/bin/bats ./test/installers/main.bats
src/setup/profile-config.bash

# omz - one liner
( docker run -it --name docker-test -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname docker-test --rm jchan48h/docker-test:latest zsh )
( docker run -it --name docker-test -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname docker-test --rm  --entrypoint ./assets/entrypoints.d/entrypoint.sh jchan48h/docker-test:latest zsh )
( docker run -it --name docker-test -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname docker-test --rm --entrypoint ./assets/entrypoints.d/entrypoint.sh jchan48h/docker-test:latest zsh )

```