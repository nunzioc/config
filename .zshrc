# Lines configured by zsh-newuser-install
HISTFILE=.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

path+=$HOME/.local/bin

# prompt showing red error codes
PROMPT='%(?..%F{red}%?%f)%# '

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# initialize z.lua
eval "$(lua $HOME/source/z.lua/z.lua --init zsh enhanced once)"
export _ZL_ECHO=1

# always ls after changing dir
chpwd() {
  ls
}

# Aliases:
# manage config files
alias config="/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME"
alias csync="config commit --allow-empty -am 'sync' && config pull && config push"

alias k="kak"
alias ddg="ddgr -n 3"
alias i="sudo apt install"
alias xi="sudo xbps-install"

alias j="z"
alias b="z -b"
alias ji="z -i"

alias gs="git status"
alias gc="git commit"
alias gf="git fetch -p --tags"
alias gp="git pull"
alias gb="git branch -a"
alias ga="git add . -v"
alias gl="git log --oneline --graph --decorate -n 15"
alias gd="git diff --histogram --word-diff=color"
alias gco="git checkout"

source /home/user/.config/broot/launcher/bash/br
