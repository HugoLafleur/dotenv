#!/bin/sh

cd dotfiles
for dotfile in `ls -A1`
do
   ln -fs $(pwd)/${dotfile} ~/.${dotfile}
done
