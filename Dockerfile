#
# This Dockerfile is for quickly setting up a dev environment
# where the dotfiles can be tested over and over again
#
FROM ubuntu:20.04

RUN apt-get update && \
      apt-get -y install sudo 

RUN adduser --group --system devuser
RUN echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir -p /home/devuser/.dotfiles
ADD .dotfiles /home/devuser/.dotfiles

RUN chown -R devuser:devuser /home/devuser/.dotfiles
RUN chmod 700 -R /home/devuser/.dotfiles

USER devuser

WORKDIR /home/devuser

# To avoid immediate exit after container run is finished
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null"]
