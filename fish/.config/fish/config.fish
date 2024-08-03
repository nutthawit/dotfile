if status is-interactive
    fish_add_path /home/tie/.cargo/bin
    fish_add_path /home/tie/.fzf/bin
    set -x _ZO_ECHO 1
    zoxide init fish | source
end
