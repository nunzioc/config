# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
# PROMPT='%(?..%F{red}%?%f)%# '

# plugins
# powerlevel10k theme
source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
# fish like autosuggestions
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# fish like syntax highlighting
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# initialize z.lua
# eval "$(lua $HOME/source/z.lua/z.lua --init zsh enhanced once)"
# export _ZL_ECHO=1

# always ls after changing dir
chpwd() { ls }

# Aliases:
# manage config files
alias config="/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME"
alias csync="config commit --allow-empty -am 'sync' && config pull && config submodule update --init --recursive && config push"

[ -e .zshalias ] && source .zshalias

alias k="kak -c main"
alias py="python"

os=$(lsb_release -d)
case $os in
    *Ubntu*)
        alias s="sudo apt search"
        alias i="sudo apt install" ;;
    *Fedora*)
        alias s="sudo dnf search"
        alias i="sudo dnf install" ;;
    *)
        alias s="echo 'Error: No search alias for this OS'"
        alias i="echo 'Error: No install alias for this OS'" ;;
esac

alias j="z"
alias b="z -b"
alias ji="z -i"

alias gs="git status"
alias gc="git commit"
alias gf="git fetch -p --tags"
alias gp="git pull"
alias gb="git branch -a"
alias gr="git rebase"
alias grcon="git rebase --continue"
alias ga="git add . -v"
alias gl="git log --oneline --graph --decorate -n 15"
alias gd="git diff --histogram --word-diff=color"
alias gco="git checkout"

# source $HOME/.config/broot/launcher/bash/br

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
