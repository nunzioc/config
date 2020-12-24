function config
    set config_git_bin (which git)
    $config_git_bin --git-dir=$HOME/.configrepo/ --work-tree=$HOME $argv
end
