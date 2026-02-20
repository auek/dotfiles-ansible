#!/bin/bash

# Default values for options
distro="ubuntu"
tags="full"

usage() {
  echo "Docker Development Environment Setup Script"
  echo
  echo "Usage: $0 [-d|--distros <distro>] [-t|--tags <tags>]"
  echo
  echo "Options:"
  echo "  -h, --help              Show this help message"
  echo "  -d, --distro <distro>  Specify distribution (ubuntu|fedora)"
  echo "                          Default: ubuntu"
  echo "  -t, --tags <tags>       Specify installation tags:"
  echo "                          - full: Complete development environment (default)"
  echo "                          - slim: Minimal installation"
  echo "                          - Or specific components: system,dotfiles,shell,development"
  echo "                          Default: full"
  echo
  echo "Examples:"
  echo "  $0                      # Run with defaults (ubuntu, full)"
  echo "  $0 -d fedora           # Run full installation on Fedora"
  echo "  $0 -d ubuntu -t slim   # Run minimal installation on Ubuntu"
  echo "  $0 -t system,dotfiles  # Install specific components on Ubuntu"
  echo
  exit 1
}

while [ "$1" != "" ]; do
  case $1 in
    -h | --help)
      usage
      ;;
    --distro=*)
      distro="${1#*=}"
      ;;
    -d)
      shift
      distro="$1"
      ;;
    --tags=*)
      tags="${1#*=}"
      ;;
    -t)
      shift
      tags="$1"
      ;;
    *)
      echo "Invalid option: $1"
      exit 1
      ;;
  esac
  shift  # Move to the next argument
done

# Split the tags into an array
IFS=',' read -r -a tags_array <<< "$tags"

# Check if the tags are valid
for tag in "${tags_array[@]}"; do
  if [ "$tag" != "full" ] && [ "$tag" != "slim" ] && [ "$tag" != "system" ] && [ "$tag" != "dotfiles" ] && [ "$tag" != "development" ] && [ "$tag" != "shell" ]; then
    echo "Invalid tag: $tag"
    echo "Tags must be one of: full, slim, system, dotfiles, development, shell"
    exit 1
  fi
done

if [ "$distro" == "" ]; then
  printf "Please provide a distro argument. Use 'ubuntu' or 'fedora'.\n"
  exit 1
fi

if [ "$distro" == "ubuntu" ] || [  "$distro" == "fedora" ]; then
  docker compose up -d "dotfiles-$distro" && \
    docker compose exec "dotfiles-$distro" bash /home/devuser/code/.dotfiles/bin/bootstrap "$tags"
    else
      printf "Invalid argument. Please use 'ubuntu' or 'fedora'.\n"
      exit 1
fi


