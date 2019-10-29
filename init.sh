#!/bin/sh

for dotfile in `find $(pwd)/dotfiles -maxdepth 1 -type f`
do
   echo ln -fs ${dotfile} ~
done
