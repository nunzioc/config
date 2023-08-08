function funsave
    set name $argv[1]
    funcsave $argv
    config add $HOME/.config/fish/functions/$name.fish
end
