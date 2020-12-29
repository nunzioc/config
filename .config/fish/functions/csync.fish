# sync config files
function csync
    config commit --allow-empty -am 'sync' && config pull && config push
end
