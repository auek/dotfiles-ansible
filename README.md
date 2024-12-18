# Dotfiles - automated setup of development environment

## Prerequisites
Ubuntu 
Docker (if you want to use Dockerfile)

## How to run in Docker
docker-compose up -d
docker-compose exec -it dotfiles bash
. .dotfiles/bin/bootstrap // This will install ansible and run the playbook

## Remove docker container
docker-compose down

## Remove Docker image
docker rmi auek/dotfiles

