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
  alias t="exa --icons --classify --sort=type -T -L 2"
fi
alias vim="nvim"


# Git
alias gst="git status"
alias gb="git branch"
alias glg="git log"
alias gp="git push"
alias gpsup="git push -u origin HEAD"
alias gl="git pull"
alias gcane="git commit --amend --no-edit"
alias gcam="git commit -am"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout main || git checkout master"

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

# Start tmux if not already running
if [ "$TMUX" = "" ]; then
  # Start new session without detaching
  tmux new-session -s dev \; \
    split-window -v -p 30 \; \
    split-window -h -p 50 \; \
    select-pane -t 0
fi

FZF_CMD_ARGS="--hidden --exclude .git --exclude node_modules --exclude .cache --exclude .venv --exclude cache"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f $FZF_CMD_ARGS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FZF_CMD_ARGS"

export FZF_DEFAULT_OPTS='--tmux center --preview "[[ -f {} ]] && bat --color=always --style=header,grid --line-range :500 {} || echo {} is a directory"'

source <(fzf --zsh)


