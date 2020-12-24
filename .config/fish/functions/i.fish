function i
    switch (lsb_release -d)
        case "*Ubuntu*"
            sudo apt install $argv
        case "*Fedora*"
            sudo dnf install $argv
    end
end
