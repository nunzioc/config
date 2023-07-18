function fish_prompt
    if test (hostname) = "toolbox"
        echo -n toolbox
    end
    echo -n (prompt_pwd -d 1)
    set_color green; echo -n ' ❯ '; set_color normal
end
