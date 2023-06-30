function mk
    mkdir $argv[1] && cd $argv[1] && prompt_pwd -d 3 (pwd)
end
