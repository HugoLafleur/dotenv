export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTTIMEFORMAT="[%F %T] "

export HOMEBREW_GITHUB_API_TOKEN=1a68d4f73a0653ad386142aa4113348da9314da8

export PS1="\[\033[38;5;42m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;1m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;220m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\]\\$ \[$(tput sgr0)\]"

complete -C aws_completer aws
complete -C aws_completer prod
complete -C aws_completer tst
complete -C aws_completer dev

