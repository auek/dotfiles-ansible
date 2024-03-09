FROM ubuntu:20.04

RUN apt-get update && \
      apt-get -y install sudo

RUN adduser --group --system devuser
RUN echo "devuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER devuser

WORKDIR /home/devuser

COPY .dotfiles .

# To avoid immediate exit after container run is finished
ENTRYPOINT ["tail"]
CMD ["-f", "/dev/null"]
