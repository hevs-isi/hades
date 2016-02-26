# Not bash or zsh?
[ -n "$BASH_VERSION" -o -n "$ZSH_VERSION" ] || return 0

# Not an interactive shell?
[[ $- == *i* ]] || return 0

alias ssh-hades="ssh -o \"ProxyCommand ssh sshfwd@hades.hevs.ch -W %h:%p\""

true
