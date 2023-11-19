#!/usr/bin/env bash
# experimental
# should run installer/main.bats or some smoke test
docker pull debian:bookworm # debian 12
# docker pull debian:bullseye # debian 11

exit 0
# From dir root
git 
# Build Only
docker build -t docker-test:dev -f ./dockers/docker-test/Dockerfile .
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . && docker run -it --name $N --hostname $N --rm $N:dev bash)

# Build and run it - bash - volume mounted
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . && docker run -it --name $N -v "$(pwd):/app" -w "/app" --hostname $N --rm $N:dev bash)

# Build and run zsh + ssh volume
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . && docker run -it --name $N -v "$HOME/.ssh/:/root/.ssh" -v "$(pwd):/app" -w "/app" --hostname $N --rm $N:dev zsh)

# 
(F=./dockers/docker-test/;N="docker-test"; docker build -t $N:dev -f $F/Dockerfile . && docker run -it --name $N -v "$(pwd):/app" --hostname $N --rm $N:dev bash)

exit 0
docker pull debian:bookworm
