# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt notify
unsetopt autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '$HOME/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

path+=$HOME/.local/bin

# prompt showing red error codes
# PROMPT='%(?..%F{red}%?%f)%# '

setopt share_history
export HISTTIMEFORMAT="[%F %T] "
setopt hist_find_no_dups

# completion options
setopt complete_in_word
setopt always_to_end
setopt path_dirs
setopt auto_list
autoload -U compinit && compinit
# match anwhere in a word
zstyle ':completion:*' matcher-list '' '' '' 'l:|=*' 'r:|=*'

# _history-incremental-search-backward () {
#     zle .history-incremental-search-backward $BUFFER
# }
# zle -N history-incremental-search-backward _history-incremental-search-backward

# plugins
# autocomplete
# source $HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zstyle ':autocomplete:*' min-delay 0.5
# zstyle ':autocomplete:*' min-input 5
# powerlevel10k theme
source $HOME/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
# fish like autosuggestions
source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# fish like syntax highlighting
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh script for autojump
export ZSHZ_CMD=j
export ZSHZ_TILDE=1
export ZSHZ_UNCOMMON=1
source $HOME/.config/zsh/zsh-z/zsh-z.plugin.zsh



# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# enable direnv
eval "$(direnv hook zsh)"

# initialize z.lua
# eval "$(lua $HOME/source/z.lua/z.lua --init zsh enhanced once)"
# export _ZL_ECHO=1

# always ls after changing dir
chpwd() { ls }
# no beeping noise please
setopt nobeep
# interpret a single value as `cd $value` if the value isn't a command
setopt autocd
# allow more complex glob patterns
setopt extendedglob
# simple spellcheck of commands
setopt correct

# Aliases:
# manage config files
alias config="/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME"
alias csync="config commit --allow-empty -am 'sync' && config pull && config submodule update --init --recursive && config push"

[ -e .zshalias ] && source .zshalias

alias k="kak -c main"
alias py="python"

os=$(lsb_release -d)
case $os in
    *Ubuntu*)
        alias s="sudo apt search"
        alias i="sudo apt install" ;;
    *Fedora*)
        alias s="sudo dnf search"
        alias i="sudo dnf install" ;;
    *)
        alias s="echo 'Error: No search alias for this OS'"
        alias i="echo 'Error: No install alias for this OS'" ;;
esac

alias ...="cd ../.."
alias ....="cd ../../.."

alias gs="git status"
alias gc="git commit -m"
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
oc=~/projects/operations-center/oc
kim=/home/user/projects/kim
