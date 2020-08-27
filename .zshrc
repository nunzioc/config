# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# initialize z.lua
eval '$(lua $HOME/source/z.lua/z.lua zsh enhanced once)'

# Aliases:
# manage config files
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'
alias csync='config commit -am "sync" && config push'

# conveniance
alias k='kak'
alias j='z'
alias b='z -b'
alias ji='j -i'

# git
alias gs='git status'
alias gf='git fetch -p --tags'
alias gp='git pull'
alias gb='git branch -a'
alias ga='git add . -v'
alias gl='git log --oneline --graph --decorate -n 15'
alias gd='git diff -histogram --word-diff=color'
