# Dotfiles - automated setup of development environment

## Prerequisites
Ubuntu 24.04 or Fedora 40+

Docker (if you want to use it)

## Docker instructions

### Starting the containers and watching the logs

`bash docker-run.sh ubuntu`

or

`bash docker-run.sh fedora`

after the bootstrap is done, it should reload the shell and start the zsh shell

### Connecting to the container manually

`docker compose exec -it dotfiles-ubuntu zsh -l`

or

`docker compose exec -it dotfiles-fedora zsh -l`

### Stop and remove the containers
`docker compose down`

### Remove the image
`docker rmi auek/dotfiles-ansible:ubuntu`

or

`docker rmi auek/dotfiles-ansible:fedora`



