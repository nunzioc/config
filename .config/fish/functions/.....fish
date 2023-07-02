function .... --wraps='cd ../../.. && prompt_pwd'
set target (path normalize (pwd)/../../..)
set_color blue; prompt_pwd $target; set_color normal
cd $target
end
