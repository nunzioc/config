function fish_prompt
    set last_status $status
    echo
    if test (hostname) = "toolbox"
        echo -n toolbox:
    end

    # Retrieve the current number of background jobs
    set job_count (count (jobs))
    
    # Set prompt structure
    set_color $fish_color_cwd
    if test $job_count -gt 0
        echo -n "($job_count) "
    end
    set_color normal

    echo (prompt_pwd -d 3) (fish_git_prompt)

    # if jobs -q
       # jobs -c | string join ', '
    # end
    # echo (prompt_pwd -d 4) (fish_git_prompt)

    if test $last_status -gt 0
        set_color red;
        echo -n $last_status:' '
    else if not test -z $transient_status && test $transient_status -gt 0
        set_color red;
        echo -n $transient_status:' '
    else
        set_color green;
    end
    echo -n '❯❯ '; set_color normal
end
