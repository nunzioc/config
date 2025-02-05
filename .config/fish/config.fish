#! /usr/bin/fish

# turn off greeting message
set fish_greeting

# key bindings
bind \ek "echo; prevd; commandline -f repaint"
bind \ej "echo; nextd; commandline -f repaint"

# you can modify path here
set -x PATH $PATH $HOME/.local/bin/ $HOME/.cargo/bin $HOME/.emacs.d/bin
set -g EDITOR micro

# opam configuration
# source /home/ncicone/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# rust
if type -q cargo
    source "$HOME/.cargo/env.fish" 
end    
