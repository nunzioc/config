function __on_nvmrc --on-variable PWD
    if test -e $PWD/.nvmrc && type -q nvm
        nvm use
    end
end
