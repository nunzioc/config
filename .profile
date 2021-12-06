#!/bin/sh
setxkbmap -option caps:ctrl_modifier
export PATH=~/.npm-global/bin:$PATH
if type "kak" >/dev/null; then
    export EDITOR=kak
    # export PAGER=kak
fi

# use local profile settings if it exists
[ -f $HOME/.local_profile ] && source $HOME/.local_profile
source "$HOME/.cargo/env"
