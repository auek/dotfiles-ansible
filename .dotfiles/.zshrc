### Binds ###
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

### Aliases ###
alias p="pwd"
alias l="ls"
alias ll="ls -lah"
alias t="tree -LC 2 --gitignore | less -R" 
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../../.."

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
export PATH=/home/august/.local/bin:$PATH

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

plugins=(git zsh-autosuggestions)

#source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

