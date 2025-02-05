#!/bin/sh
setxkbmap -option caps:ctrl_modifier
export PATH=~/.npm-global/bin:$PATH
if type "kak" >/dev/null; then
    export EDITOR=kak
    # export PAGER=kak
fi

# use local profile settings if it exists
[ -f $HOME/.local_profile ] && source $HOME/.local_profile
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
source "/Users/TUT1039/.rover/env"
