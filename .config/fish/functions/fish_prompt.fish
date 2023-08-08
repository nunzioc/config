function fish_prompt
    echo
    set last_status $status
    if test (hostname) = "toolbox"
        echo -n toolbox:
    end
    echo (prompt_pwd -d 1) (fish_git_prompt)
    if test $last_status -gt 0
        set_color red;
        echo -n " "$last_status
    else
        set_color green;
    end
    echo -n '❯❯ '; set_color normal
end
