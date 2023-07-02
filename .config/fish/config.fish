#! /usr/bin/fish

source ./abbr.fish


alias '...'='cd ../.. && pwd'
alias '....'='cd ../../.. && pwd'

# turn off greeting message
set fish_greeting

# run ls whenever the path changes
function list_dir --on-variable PWD
    if test (ls | wc -l) -lt 20
       ls
    end
end
# TODO switch to fish_add_path
# you can modify path here
set -x PATH $PATH $HOME/.local/bin/ $HOME/.cargo/bin $HOME/.emacs.d/bin

# set length of prompt directories
#set -g fish_prompt_pwd_dir_length

# use vi bindings with emacs bindings
function hybrid_bindings --description "vi style bindings that inherit emacs bindings"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end

set -g fish_key_bindings hybrid_bindings
# disable vi mode prompt
function fish_mode_prompt
end

# opam configuration
# source /home/ncicone/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
