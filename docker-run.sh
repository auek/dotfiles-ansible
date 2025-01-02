#!/bin/bash

# Default values for options
distro=""
tags=""

# Loop through all the arguments
while [ "$1" != "" ]; do
    case $1 in
        --distro=*)
            distro="${1#*=}"   # Extract the value after '='
            ;;
        -d)
            shift
            distro="$1"       # The next argument is the value for the short name
            ;;
        --tags=*)
            tags="${1#*=}"   # Extract the value after '='
            ;;
        -t)
            shift
            tags="$1"       # The next argument is the value for the short name
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


