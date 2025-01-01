#!/bin/bash

distro=$1

if [ "$distro" == "ubuntu" ] || [  "$distro" == "fedora" ]; then
  docker compose up -d "dotfiles-$distro" && \
  docker compose exec "dotfiles-$distro" sh /home/devuser/code/.dotfiles/bin/bootstrap
  else
    printf "Invalid argument. Please use 'ubuntu' or 'fedora'.\n"
    exit 1
fi
