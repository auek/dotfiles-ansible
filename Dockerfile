#
# This Dockerfile is for quickly setting up a dev environment
# where the dotfiles can be tested over and over again
#
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get -y install sudo 

# Ubuntu 22.04 have adduser command
#RUN adduser --group --system devuser && \
#    echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Ubuntu 24.04 have groupadd and useradd command
RUN groupadd -r devuser && \
    useradd -r -g devuser -m -d /home/devuser devuser && \
    echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Switch to devuser
USER devuser
WORKDIR /home/devuser

# To avoid immediate exit after container run is finished
ENTRYPOINT ["tail", "-f", "/dev/null"]
