# Conda Juptyer Node
* 
```bash
cd devcontainers/conda-jupyter-node
code devcontainers/conda-jupyter-node
```
```bash
docker compose -f ./docker/docker-compose.yml up -d # detached

docker compose -f ./docker/docker-compose.yml start
docker compose -f ./docker/docker-compose.yml attach webapp # will kill if exit

docker compose -f ./docker/docker-compose.yml exec webapp /bin/zsh
```