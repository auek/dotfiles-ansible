# Dotfiles - automated setup of development environment

## Prerequisites
Ubuntu 24.04 or Fedora 40+

Docker (if you want to use it)

## Docker instructions

### Starting the containers

`docker-compose up -d dotfiles-ubuntu`

or

`docker-compose up -d dotfiles-fedora`

### Connecting to the container

`docker-compose exec -it dotfiles-ubuntu bash`

or

`docker-compose exec -it dotfiles-fedora bash`


### Setup the development environment inside the container

`sh code/.dotfiles/bin/bootstrap` 

afterwards, switch to zsh:

`exec zsh`

### Stop and remove the container
`docker-compose down`

### Remove the image
`docker rmi auek/dotfiles-ansible:ubuntu`

or

`docker rmi auek/dotfiles-ansible:fedora`



