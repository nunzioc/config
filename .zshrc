# Lines configured by zsh-newuser-install
HISTFILE=.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ncicone/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

eval "$(lua53 ~/source/z.lua/z.lua --init zsh enhanced once)"
