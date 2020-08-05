#! /usr/bin/fish

abbr -a install sudo dnf install
abbr -a search sudo dnf search
abbr -a gf git fetch -p
abbr -a gp git pull
abbr -a gl git log --oneline --graph --decorate -n 15
abbr -a gc git commit -m
abbr -a gb git branch -a
abbr -a ga git add . -v
abbr -a gd git diff --histogram --color
abbr -a gs git status

# an alias for managing config files
# use:
# config config --local status.showUntrackedFiles no
# to avoid showing untracked files
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'

# turn off greeting message
set fish_greeting

# you can modify path here
set -x PATH $PATH ~/source/plan9port/bin/

# plan9port stuff
set -x PLAN9 ~/source/plan9port
# set length of prompt directories
set -g fish_prompt_pwd_dir_length 3

# FZF
function fk
  kak (fzf --height 50% --reverse)
end

bind \ck 'fk'

# z.lua
source (lua ~/source/z.lua/z.lua --init fish enhanced | psub)

function __z.lua_subdirectory
  z -I -c .
  clear
  ls
  commandline -f repaint
end

bind \cd '__z.lua_subdirectory'

