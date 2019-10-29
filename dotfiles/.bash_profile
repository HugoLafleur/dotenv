#!/bin/bash

export BASH_SILENCE_DEPRECATION_WARNING=1

`which brew > /dev/null 2>&1` && [[ -f $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

if [ -f ~/.bashrc  ]; then
  . ~/.bashrc
fi

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

if [ -f ~/.osx_aliases  ]; then
  . ~/.osx_aliases
fi

export PATH=$PATH:${HOME}/bin
export PATH="/usr/local/sbin:$PATH"