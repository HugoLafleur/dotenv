#!/bin/sh

for dotfile in `ls -A1 | grep -E "^\."| grep -vE ".*swp$|init.sh"`
do
   ln -fs `pwd`/${dotfile} ~
done
