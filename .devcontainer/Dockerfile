# FROM mcr.microsoft.com/devcontainers/base:bullseye
FROM mcr.microsoft.com/devcontainers/base:ubuntu
# add env later? from .json or from the cli?
WORKDIR /workspaces/devcontainer
SHELL ["/bin/bash", "-euxo", "pipefail", "-c"]
# https://bats-core.readthedocs.io/en/stable/tutorial.html
RUN echo 'export PATH="/workspaces/devcontainer/test/bats/bin:${PATH}"' >> /home/vscode/.zshrc && \
    echo 'source /workspaces/devcontainer/assets/profile-utils/append-zsh-alias.sh' >> /home/vscode/.zshrc
# todo shold source the custome stuff in from assets
CMD ["/bin/zsh"]
