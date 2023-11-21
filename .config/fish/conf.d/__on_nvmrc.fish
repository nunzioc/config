function __on_nvmrc --on-event fish_prompt
    if test -e $PWD/.nvmrc && type -q nvm
        nvm use
    end
end
