# Dotfiles - automated setup of development environment

## Prerequisites
Ubuntu

Docker (if you want to use it)

## Docker instructions

### Start the container

`docker-compose up -d`

`docker-compose exec -it dotfiles bash`

`. .dotfiles/bin/bootstrap # This will install ansible and run the playbook`

### Stop and remove the container
`docker-compose down`

### Remove the image
`docker rmi auek/dotfiles`



