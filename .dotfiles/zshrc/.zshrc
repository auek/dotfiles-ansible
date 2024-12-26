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
alias fd="fdfind"
alias python="python3"


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

### Settings ###

# PATH
export PATH="$HOME/.local/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
setopt appendhistory
setopt INC_APPEND_HISTORY  
setopt SHARE_HISTORY

# Case-insensitive completion
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# Turn off audio bell
unsetopt BEEP

: <<'END'
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --hidden --follow -E '**/node_modules/**' -E '**/.git/**' -E '.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
    fd --hidden -E "**/node_modules/**" -E "**/.git/**" -E ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden -E "**/node_modules/**" -E "**/.git/**" -E ".git" . "$1"
}
END
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### OMZ ###
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git ssh-agent zsh-autosuggestions)

# Skip all OMZ aliases or they will overwrite the ones defined in this file
zstyle ':omz:*' aliases no

# Add ssh keys to agent
zstyle :omz:plugins:ssh-agent identities id_ed25519 id_ed25519_contabo

#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

# Start tmux if not already running
if [ "$TMUX" = "" ]; then tmux; fi
