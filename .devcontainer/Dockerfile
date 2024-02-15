# FROM mcr.microsoft.com/devcontainers/base:bullseye
FROM mcr.microsoft.com/devcontainers/base:ubuntu
# add env later? from .json or from the cli?
WORKDIR /workspaces/devcontainer
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
RUN echo /root/.zshrc && echo /home/vscode/.zshrc
RUN echo hello > /home/vscode/hello.txt
RUN echo hello > /root/hello.txt
CMD ["/bin/zsh"]
