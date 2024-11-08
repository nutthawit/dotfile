if status is-interactive
    fish_add_path /home/tie/.cargo/bin
    fish_add_path /home/tie/.fzf/bin
    fish_add_path /home/tie/anaconda3/bin
    set -x _ZO_ECHO 1
    zoxide init fish | source
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/tie/anaconda3/bin/conda
    eval /home/tie/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/tie/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/tie/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/tie/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
