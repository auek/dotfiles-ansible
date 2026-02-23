#!/usr/bin/env zsh

### Binds ###
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

### Aliases ###
alias p="pwd"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../.."

# if exa is installed, use it instead of ls
if command -v exa &> /dev/null; then
  alias l="exa"
  alias ls="exa"
  alias ll="exa -lah"
  alias t="exa --all -I .git --icons --classify --sort=type -T -L 2"
fi

# if nvim is installed, use it instead of vim
if command -v nvim &> /dev/null; then
  alias vim="nvim"
fi

# if on WSL, use explorer.exe to open files and directories, "same" as "open" on macOS
if grep -qi microsoft /proc/version 2>/dev/null; then
  open() { explorer.exe "${1:-.}"; }
fi

# Git
alias gst="git status"
alias gb="git branch"
alias glg="git log"
alias gp="git push"
alias gpsup="git push -u origin HEAD"
alias gl="git pull"
alias gcane="git commit --amend --no-edit"
alias gcam="git commit -am"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout main || git checkout master"
alias gc-="git checkout -"

### Settings ###

# History
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY
#
# Turn off audio bell
unsetopt BEEP

# Case-insensitive completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

ZSH_THEME="robbyrussell"

plugins=(git ssh-agent zsh-autosuggestions)

# Skip all OMZ aliases or they will overwrite the ones defined in this file
zstyle ':omz:*' aliases no

# Add ssh keys to agent
zstyle :omz:plugins:ssh-agent identities id_ed25519 

#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

FZF_CMD_ARGS="--hidden --exclude .git --exclude node_modules --exclude .cache --exclude .venv --exclude cache"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f $FZF_CMD_ARGS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FZF_CMD_ARGS"

export FZF_DEFAULT_OPTS='--tmux center --preview "[[ -f {} ]] && bat --color=always --style=header,grid --line-range :500 {} || echo {} is a directory"'

source <(fzf --zsh)

