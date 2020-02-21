#!/bin/zsh
set -e

# install homebrew
if [[ -f `which brew` ]]; then
   echo -e "\e[1;33m*** updating homebrew ***\e[0m"
   brew update
   echo
   echo -e "\e[1;33m*** upgrading homebrew packages ***\e[0m"
   brew upgrade
   echo
   echo -e "\e[1;33m*** cleaning up homebrew ***\e[0m"
   brew cleanup
else
   echo "installing homebrew"
   /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install homebrew packages
echo
echo -e "\e[1;33m*** installing homebrew packages in homebrew.lst ***\e[0m"
cat homebrew.lst | xargs brew install

# install python packages
echo
echo -e "\e[1;33m*** installing python packages in requirements.txt ***\e[0m"
pip3 install -r requirements.txt

# install dotfiles
echo
echo "\e[1;33m*** linking dotfiles ***\e[0m"
cd dotfiles
for dotfile in `find . -type f -maxdepth 1 |sort| cut -d/ -f2`
do
   echo "   dotfiles/${dotfile} ->" ~/.${dotfile}
   ln -fs $(pwd)/${dotfile} ~/.${dotfile}
done
