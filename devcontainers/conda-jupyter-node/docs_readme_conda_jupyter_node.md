# Conda jupyter Node
## Goal
* Use notebook like
* https://streamlit.io/
* jupyterLab Notebook
* docker seems much faster than packer and devcontainer when creating the initial image



## Tasks
* docker debian bookworm minimal
* Install conda (micromamba)
* Install JupyterLab Notebook
  * Check iKernels
  * Check Configurations
* [ ] Add nice to haves
## Validation Criteria
* [x] conda is installed
* [x] python is installed 
  * (micromamba doesnt install python right away)
* [x] jupyterlab is installed
* [ ] jupyterlab is running
* [ ] jupyterlab is accessible from the host
* [x] jupyterlab is accessible from the browser
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
docker compose -f ./docker/docker-compose.yml down
docker compose -f ./docker/docker-compose.yml up --build
docker compose -f ./docker/docker-compose.yml up --build -d
docker compose -f ./docker/docker-compose.yml up -d # detached
docker compose -f ./docker/docker-compose.yml up # to see the logs
docker compose -f ./docker/docker-compose.yml start
docker compose -f ./docker/docker-compose.yml attach webapp # will kill if exit
docker compose -f ./docker/docker-compose.yml exec webapp /bin/zsh
# docker compose -f ./docker/docker-compose.yml
# docker run attaches to the terminal
# docker run -it --rm --name conda-jupyter-node --hostname cfn conda-jupyter-node /bin/zsh
# smoke tests
pwd |grep webapp
tree `pwd`
exit

# health check - in another terminal
docker container ls | grep conda-jupyter-node |grep health
docker image ls
```fac


# docker run --entrypoint /new/entrypoint your_image
```

# Backlog
* https://codeforwings.github.io/vite-press-docs/posix/docs_readme_bash.html#install-oh-my-zsh

* [x] node / npm
* [x] zsh
* [x] tree
* [x] oh-my-zsh
  * https://github.com/devcontainers-contrib/features/tree/main/src/zsh-plugins
* tmux

# Not Planned
* ssh
* git config
* packer
* voila
* network etc.
* [ ] Add vscode snippets
* [ ] vscode extention
* jetbrains...
* migrate / check the codespace sample
* squid / apt-cacher-ng
  * just ignore for now.. docker is fast enough



# JuptyerLab
```bash
jupyter notebook --generate-config
jupyter notebook password
jupyter lab list
jupyter lab --help
jupyter lab --ip=0.0.0.0
jupyter lab --no-browser
jupyter lab --notebook-dir=/path/to/notebook/directory
# right... need to default th theme etc
```

# Other kernels
* https://docs.jupyter.org/en/latest/projects/kernels.html
* https://github.com/jupyter/jupyter/wiki/Jupyter-kernels

* https://github.com/n-riesco/ijavascript
  * ijavascript