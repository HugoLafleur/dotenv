#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH=$PATH:${HOME}/bin
export PATH="/usr/local/sbin:$PATH"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

if [ -f ~/.git_aliases  ]; then
  . ~/.git_aliases
fi

if [ -f ~/.xp_aliases  ]; then
  . ~/.xp_aliases
fi

if [ -f ~/.ansible_aliases  ]; then
  . ~/.ansible_aliases
fi

if [ -f ~/.bash_aliases  ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.aws_aliases  ]; then
  . ~/.aws_aliases
fi

# tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }
ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}
ensure_tmux_is_running
