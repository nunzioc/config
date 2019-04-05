#! /usr/bin/fish

abbr -a install sudo dnf install
abbr -a search sudo dnf search

# you can modify path here
set -x PATH $PATH 

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
