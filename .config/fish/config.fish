#! /usr/bin/fish

abbr -a -g py python
abbr -a ru ruplacer
abbr -a -g icat kitty +kitten icat
abbr -a -g gf git fetch -p --tags
abbr -a -g gp git pull
abbr -a -g gl git log --oneline --graph --decorate -n 15
abbr -a -g gc git commit -m
abbr -a -g gb git branch -a
abbr -a -g ga git add . -v
abbr -a -g gd git diff --histogram --word-diff=color
abbr -a -g gs git status
abbr -a -g gr git rebase
abbr -a -g gco git checkout

alias '...'='cd ../.. && pwd'
alias '....'='cd ../../.. && pwd'
alias 'pp'='pepper --config ~/.config/pepper/config.pp'
alias 'nk'='rlwrap ~/source/k/k ~/source/k/repl.k'

switch (lsb_release -d)
    case "*Ubuntu*"
        abbr -a -g i sudo apt install
    case "*Fedora*"
        abbr -a -g i sudo dnf install
end

# turn off greeting message
set fish_greeting

set -xg EDITOR kak

# run ls whenever the path changes
function list_dir --on-variable PWD
    if test (ls | wc -l) -lt 20
       ls
    end
end

# you can modify path here
set -x PATH $PATH $HOME/.local/bin/ $HOME/.cargo/bin

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
source /home/ncicone/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# comment
alias ocmanage "~/projects/operations-center/oc/ENV/bin/python $oc/oc/manage.py"
