FROM debian:bookworm
# i should be using buildkit for this
# FROM buildpack-deps:bookworm
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
WORKDIR /app/
COPY ./src/installers/ ./src/installers/
# Install Packages core packages
ENV TZ=America/Toronto
RUN ./src/installers/main.bash

COPY ./src/setup/ ./src/setup/
COPY ./assets/ ./assets/
RUN ./src/setup/profile-config.bash

ENV PATH "/root/.local/bin:${PATH}"
COPY ./ /app/
# should optimize this build... for isntallation especially

# migrate me later - assumes mounted .ssh for dev
RUN set -eux ; \
    echo 'root:asdf' | chpasswd && \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config.d/allow_root_login_with_password.conf && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config.d/no_checking.conf && \
    echo "UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config.d/no_checking.conf && \
    ssh-keygen -A && \
    mkdir -p /run/sshd \
    ;
# ENV PATH "/root/.local/bin:${PATH}"
# just use systemctl lol - nvm
## etc/init.d/ssh start
# works though
# supervisord later
# totally rm cockpit / seperate it
## might no be latest:
# wget https://github.com/45Drives/cockpit-navigator/releases/download/v0.5.10/cockpit-navigator_0.5.10-1focal_all.deb && \
# probably move this.. arg it was the -y
# COPY ./binaries/cockpit-navigator_0.5.10-1focal_all.deb /cockpit-navigator_0.5.10-1focal_all.deb
# RUN set -eux ; \
    # apt install ./cockpit-navigator_0.5.10-1focal_all.deb -y
# EXPOSE 22
# EXPOSE 9090

ENTRYPOINT [ "./assets/entrypoints.d/entrypoint.sh" ]
CMD [ "zsh" ]
# 