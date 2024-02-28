# Conda jupyter Node
## Goal
* Use notebook like
* https://streamlit.io/
* juypterlab
* docker seems much faster than packer and devcontainer when creating the initial image



## Tasks
* docker debian bookworm minimal
* Install conda (micromamba)
* Install JupyterLab Notebook
  * Check iKernels
  * Check Configurations
* [ ] Add nice to haves
## Validation Criteria
* [ ] conda is installed
* [ ] python is installed 
  * (micromamba doesnt install python right away)
* [ ] jupyterlab is installed
* [ ] jupyterlab is running
* [ ] jupyterlab is accessible from the host
* [ ] jupyterlab is accessible from the browser
* [ ] jupyterlab is accessible w/o token

###  Nice to haves
* [ ] Save conda environment.env
* [ ] Save jupyterlab configurations
* [ ] Nice Tutorial


# Dev note
* Using docker to streamline the speed
* and/or packer

## Docker
* Entry Point to smoke test

```bash
# Docker
# assuming pwd is conda-jupyter-node/
# docker build -t jchan48h/conda-jupyter-node ./docker
docker image prune -f
docker container prune -f
exit
docker compose -f ./docker/docker-compose.yml rm --force --volumes
docker compose -f ./docker/docker-compose.yml down --remove-orphans --volumes
docker compose -f ./docker/docker-compose.yml up --build
docker compose -f ./docker/docker-compose.yml up -d # detached
# docker compose -f ./docker/docker-compose.yml
# docker run attaches to the terminal
docker run -it --rm --name conda-jupyter-node --hostname cfn conda-jupyter-node:latest /bin/zsh
# smoke tests
pwd |grep webapp
tree `pwd`
exit

# health check - in another terminal
docker container ls | grep conda-jupyter-node |grep health
docker image ls
```


# docker run --entrypoint /new/entrypoint your_image
```

# Backlog
* node / npm
* zsh
* tree
* oh-my-zsh
  * https://github.com/devcontainers-contrib/features/tree/main/src/zsh-plugins
* tmux
* https://codeforwings.github.io/vite-press-docs/posix/docs_readme_bash.html#install-oh-my-zsh

# Not Planned
* ssh
* git ocnfig
* packer
* voila
* network etc.
* [ ] Add vscode snippets
* [ ] vscode extention
* jetbrains...
* migrate / check the codespace sample
* squid / apt-cacher-ng
  * just ignore for now.. docker is fast enough
