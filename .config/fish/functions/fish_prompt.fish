function fish_prompt
    if test (hostname) = "toolbox"
        echo -n toolbox
    end
    echo -n (prompt_pwd)
    set_color green; echo -n ' ❯ '; set_color normal
    set -g fish_prompt_pwd_dir_length 1
end
