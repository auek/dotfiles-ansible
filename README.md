# Dotfiles - automated setup of development environment

Using ansible to automate the setup of a development environment.

## Features

- 🛠️ Automated system configuration
- 📁 Dotfiles management
- 🐚 ZSH shell setup
- 🔧 Development tools installation
- 🐳 Docker support for testing

## Prerequisites
- **Operating System:**
    - Ubuntu 24.04
    - Fedora 40+
- Docker (optional, for testing)
- Empty or non-existant `$HOME/.dotfiles` directory

## Installation Options

### 1. Using Docker (Recommended for testing)

#### Basic Usage
```bash
# See all available options
bash docker-run.sh --help

# Run the full setup for Ubuntu
bash docker-run.sh 

# Or customize the setup
bash docker-run.sh -d fedora -t slim

```

#### Docker reference
```bash
# Connect to running container
docker compose exec -it dotfiles-ubuntu zsh -l # for Ubuntu
docker compose exec -it dotfiles-fedora zsh -l # for Fedora

# Stop and remove the containers
docker compose down

# Remove the image
docker rmi auek/dotfiles-ansible:ubuntu # for Ubuntu
docker rmi auek/dotfiles-ansible:fedora # for Fedora

```

### 2. Direct Installation (For actual system setup) DO AT YOUR OWN RISK

```bash
bash .dotfiles/bin/bootstrap 
```



