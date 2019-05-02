#! /usr/bin/fish

abbr -a install sudo dnf install
abbr -a search sudo dnf search
abbr -a gf git fetch -p
abbr -a gp git pull
abbr -a gl git log --oneline --graph --decorate
abbr -a gc git commit -m
abbr -a gb git branch -a
abbr -a ga git add . -v
abbr -a gd git diff --histogram
abbr -a gs git status

# an alias for managing config files
# use:
# config config --local status.showUntrackedFiles no
# to avoid showing untracked files
alias config='/usr/bin/git --git-dir=$HOME/.configrepo/ --work-tree=$HOME'

# you can modify path here
set -x PATH $PATH 
#
# set length of prompt directories
set -g fish_prompt_pwd_dir_length 3

# FZF
function f
  cd ~
  cd (find -type d | fzf --height 50% --reverse)
  ls
end

function fk
  kak (fzf --height 50% --reverse)
end
