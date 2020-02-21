#!/bin/sh
set -e

# install homebrew
if [[ -f `which brew` ]]; then
   echo "updating homebrew"
   brew update
   echo
   echo "upgrading homebrew packages"
   brew upgrade
   echo
   echo "cleaning up homebrew"
   brew cleanup
else
   echo "installing homebrew"
   /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install homebrew packages
echo
echo "installing homebrew packages in homebrew.lst"
cat homebrew.lst | xargs brew install

# install python packages
echo
echo "installing python packages in requirements.txt"
pip3 install -r requirements.txt

# install dotfiles
echo
echo "linking dotfiles"
cd dotfiles
for dotfile in `find . -type f -maxdepth 1 |sort| cut -d/ -f2`
do
   echo "   dotfiles/${dotfile} ->" ~/.${dotfile}
   ln -fs $(pwd)/${dotfile} ~/.${dotfile}
done
