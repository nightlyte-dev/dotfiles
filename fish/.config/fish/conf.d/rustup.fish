# rustup shell setup
if test -d "$HOME/.cargo/bin"; and not contains "$HOME/.cargo/bin" $PATH
    # Prepending path in case a system-installed rustc needs to be overridden
    set -x PATH "$HOME/.cargo/bin" $PATH
end
