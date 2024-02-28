FROM debian:bookworm-slim
# https://docs.docker.com/reference/dockerfile/

# known dependencies: curl
# dev dependencies: zsh tree tldr git wget
# omz: git ca-certificates procps (ps)
RUN apt-get update && apt-get install -y \
  curl \
  zsh tree wget git ca-certificates procps \
  && rm -rf /var/lib/apt/lists/*
# rm -rf /var/lib/apt/lists/* is to clean up after apt-get
# maybe add tmux etc. only

# assume mounted docker to /webapp using compose
SHELL ["/bin/bash", "-c"]

# won't actually mount anything. it's for documentation
VOLUME ["/webapp"]
WORKDIR /webapp
# COPY . /webapp
# using compose to mount
# copy lib over for zsh? or nah
# default port for jupterlab
EXPOSE 8888

HEALTHCHECK --interval=5m --timeout=3s \
  CMD set -euxo pipefail; printenv SHELL | grep -i zsh ; \
  curl -f http://localhost:8888/ || exit 1

# entrypoint if mounting using compose has to be in compose
# ENTRYPOINT [ "./entrypoints/smoke-tests.sh" ]
# cmd is also overided by compose since entrypoint was declared there
SHELL ["/bin/zsh", "-c"]
ENV SHELL=/usr/bin/zsh
COPY ./lib/*.sh ./lib/
RUN set -x ; chsh -s $(which zsh) && ./lib/readme_zsh_plugin_copy.md.sh
CMD /bin/zsh
