#!/bin/sh

for dotfile in `find $(pwd)/dotfiles -mindepth 1 -maxdepth 1`
do
   ln -fs ${dotfile} ~
done
