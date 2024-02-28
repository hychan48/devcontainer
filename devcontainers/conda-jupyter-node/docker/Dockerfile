FROM debian:bookworm-slim
# https://docs.docker.com/reference/dockerfile/

# known dependencies: curl
# dev dependencies: zsh tree tldr git wget
RUN apt-get update && apt-get install -y \
  curl \
  zsh tree wget git \
  && rm -rf /var/lib/apt/lists/*
# rm -rf /var/lib/apt/lists/* is to clean up after apt-get
# maybe add tmux etc. only

# assume mounted docker to /webapp using compose
WORKDIR /webapp
# COPY . /webapp
# using compose to mount

# default port for jupterlab
EXPOSE 8888
# Entrypoint for smoke testing / health check
# might sneakily use it to run conda though?
RUN tree `pwd` -f
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost:8888/ || exit 1
# RUN ls -l chmod +rx ./entrypoints/smoke-test.sh
# ENTRYPOINT [ "./entrypoints/smoke-test.sh" ]
CMD /bin/zsh


