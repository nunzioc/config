# maybe use this for git prompt??
# git branch | awk '/^\*/ { if ($2 == "(HEAD") { print substr($5, 1, length($5)-1) } else { print $2 } 
function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    __terlar_git_prompt
    __fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    # Arrow
    echo -n '➤ '
    set_color normal
end
