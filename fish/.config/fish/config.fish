source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Set Neovim as manpager
set -e MANPAGER
set -gx MANPAGER 'nvim +Man!'
set -gx EDITOR nvim
# Vi Mode
fish_vi_key_bindings

function fish_user_key_bindings
    bind -M visual y fish_clipboard_copy
    bind -M normal yy fish_clipboard_copy
    bind -M default p 'commandline -f forward-single-char; fish_clipboard_paste'
    bind --mode visual --sets-mode default p "commandline -f kill-selection end-selection; fish_clipboard_paste; set fish_bind_mode default; commandline -f repaint-mode"
end

# Zoxide init - replaces `cd`
zoxide init fish --cmd cd | source
