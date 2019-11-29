#! /usr/bin/fish

abbr -a install sudo dnf install
abbr -a search sudo dnf search
abbr -a remove sudo dnf remove
abbr -a uninstall sudo dnf remove
abbr -a gf git fetch -p --tags
abbr -a gp git pull
abbr -a gl git log --oneline --graph --decorate -n 15
abbr -a gc git commit -m
abbr -a gb git branch -a
abbr -a ga git add . -v
abbr -a gd git diff --histogram --word-diff=color
abbr -a gs git status
abbr -a gr git rebase

# an alias for managing config files
# use:
# config config --local status.showUntrackedFiles no
# to avoid showing untracked files
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'

# turn off greeting message
set fish_greeting

# you can modify path here
set -x PATH /home/nunziocicone/.guix-profile/bin $PATH ~/source/plan9port/bin/
#
# set length of prompt directories
#set -g fish_prompt_pwd_dir_length

set -x GUILE_LOAD_PATH /home/nunziocicone/.guix-profile/lib/guile/2.2{GUILE_LOAD_PATH:+:}$GUILE_LOAD_PATH

set -x GUILE_LOAD_COMPILED_PATH /home/nunziocicone/.guix-profile/lib/guile/2.2/site-ccache{GUILE_LOAD_COMPILED_PATH:+:}$GUILE_LOAD_COMPILED_PATH

set -x INFOPATH /home/nunziocicone/.guix-profile/share/info{INFOPATH:+:}$INFOPATH

export GUIX_LOCPATH=$HOME/.guix-profile/lib/locale

# load autojump
. /usr/share/autojump/autojump.fish

# load kitty completions
kitty + complete setup fish | source

