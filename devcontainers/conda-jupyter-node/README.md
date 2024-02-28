# Conda Juptyer Node
* 
```bash
cd devcontainers/conda-jupyter-node
code devcontainers/conda-jupyter-node
```
```bash
docker build -t jchan48h/conda-jupyter-node ./docker
docker run -it --rm --name conda-jupyter-node --hostname cjn jchan48h/conda-jupyter-node /bin/zsh
```