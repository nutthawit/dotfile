function ls --wraps=eza --description 'alias ls=eza'
    eza $argv
end

function ll --wraps=eza --description 'alias ll=eza --long --header --git'
    eza --long --header --git $argv
end
