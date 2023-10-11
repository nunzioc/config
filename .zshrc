# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
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
zstyle :compinstall filename '$HOME/.zshrc'

# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# prompt showing red error codes
# PROMPT='%(?..%F{red}%?%f)%# '

setopt share_history
export HISTTIMEFORMAT="[%F %T] "
setopt hist_find_no_dups

# _history-incremental-search-backward () {
#     zle .history-incremental-search-backward $BUFFER
# }
# zle -N history-incremental-search-backward _history-incremental-search-backward

# plugins
CONFIG_DIR=$HOME/.config/zsh
# autocomplete
# source $HOME/.config/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# zstyle ':autocomplete:*' min-delay 0.5
# zstyle ':autocomplete:*' min-input 5
# powerlevel10k theme
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS+=proxy
source $CONFIG_DIR/powerlevel10k/powerlevel10k.zsh-theme
# fish like autosuggestions
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source $CONFIG_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
# fish like syntax highlighting
source $CONFIG_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# fish like aabbreviations
source $CONFIG_DIR/zsh-abbr/zsh-abbr.zsh
# history multi word search
source $CONFIG_DIR/history-search-multi-word/history-search-multi-word.plugin.zsh
# zsh script for autojump
export ZSHZ_CMD=j
export ZSHZ_TILDE=1
export ZSHZ_UNCOMMON=1
export ZSHZ_TRAILING_SLASH=1
source $HOME/.config/zsh/zsh-z/zsh-z.plugin.zsh
# per directory history. press ^G to toggle between local and global histories
source $HOME/.config/zsh/per-directory-history/per-directory-history.zsh

# add directories to stack
setopt auto_pushd
# completion options
setopt complete_in_word
setopt always_to_end
setopt path_dirs
setopt auto_list
autoload -U compinit && compinit
# match anwhere in a word
zstyle ':completion:*' matcher-list '' '' '' 'l:|=*' 'r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:directory-stack' list-colors '=(#b) #([0-9]#)*( *)==95=38;5;12' # colors for cd -

# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

# enable direnv
# eval "$(direnv hook zsh)"

# change what counts as a word.
WORDCHARS='~!#$%^&*<>+;-'

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


open_kakoune() {
    repopwd=$(git rev-parse --show-toplevel 2>/dev/null)
    if [[ $? -eq 0 ]]
    then
        local reponame=$repopwd:t
        kak -c $reponame $* 2>/dev/null
        if [[ $? -ne 0 ]]
        then
            kak -d -s $reponame -E ":cd $repopwd" &!
            sleep .1
            kak -c $reponame $*
        fi
    else
        kak $*
    fi
}

alias k="open_kakoune"
alias py="python"

# todo: make these abbreviations
os=$(uname -a)
case $os in
    *Ubuntu*)
        alias s="sudo apt search"
        alias i="sudo apt install" ;;
    *Fedora*)
        alias s="sudo dnf search"
        alias i="sudo dnf install" ;;
    *Darwin*)
        alias s="brew search"
        alias i="brew install" ;;
    *)
        alias s="echo 'Error: No search alias for this OS'"
        alias i="echo 'Error: No install alias for this OS'" ;;
esac

alias ...="cd ../.."
alias ....="cd ../../.."

[[ ! -f $HOME/.config/zsh/local.zsh ]] || source $HOME/.config/zsh/local.zsh
# source $HOME/.config/broot/launcher/bash/br

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# autoload -U add-zsh-hook
# load-nvmrc() {
  # local node_version="$(nvm version)"
  # local nvmrc_path="$(nvm_find_nvmrc)"
# 
  # if [ -n "$nvmrc_path" ]; then
    # local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
# 
    # if [ "$nvmrc_node_version" = "N/A" ]; then
      # nvm install
    # elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # nvm use
    # fi
  # elif [ "$node_version" != "$(nvm version default)" ]; then
    # echo "Reverting to nvm default version"
    # nvm use default
  # fi
# }
# add-zsh-hook chpwd load-nvmrc

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

