function k
    kak -clear
    if string match -q 'main' (kak -l)
        kak -c main $argv
    else
        kak -s main $argv
    end
end
    
