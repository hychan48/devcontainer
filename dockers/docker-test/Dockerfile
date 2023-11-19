FROM debian:bookworm
# kinda the template
# expects mounted volume 

# Key Files
# main.bats
# main.sh
# dockers/docker-test/docker-test-build.test.sh

# Installerer
# has to copy on build
# then -v can override
# VOLUME [ "/app" ]
COPY ./src/installers/ /app/src/installers/
WORKDIR /app/
# Install Packages core packages
ENV TZ=America/Toronto
RUN ./src/installers/main.bash

COPY ./ /app/
ENV PATH "/root/.local/bin:${PATH}"
RUN ./src/setup/profile-config.bash
# should optimize this build... for isntallation especially

