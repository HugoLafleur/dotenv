#!/bin/zsh
set -e

# install homebrew
if [[ -f `which brew` ]]; then
   echo -e "\e[1;33m+++ updating homebrew +++\e[0m"
   brew update --verbose
   echo
   echo -e "\e[1;33m+++ upgrading homebrew packages +++\e[0m"
   brew upgrade --verbose
   echo
   echo -e "\e[1;33m+++ cleaning up homebrew +++\e[0m"
   brew cleanup --verbose
else
   echo "installing homebrew"
   /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install homebrew packages
echo
echo -e "\e[1;33m+++ installing homebrew packages in homebrew.lst +++\e[0m"
cat homebrew.lst | xargs brew install

# install python packages
echo
echo -e "\e[1;33m+++ installing python packages in requirements.txt +++\e[0m"
pip3 install -r requirements.txt

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# install tat script
curl https://raw.githubusercontent.com/christoomey/dotfiles/master/bin/tat > ~/workspace/.env/bin/tat

# install vim plugins
ln -fs ~/workspace/.env/dotfiles/vim ~/.vim

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install dotfiles
echo
echo "\e[1;33m+++ linking dotfiles +++\e[0m"
cd dotfiles
for dotfile in `find . -type f -maxdepth 1 |sort| cut -d/ -f2`
do
   echo "dotfiles/${dotfile} ->" ~/.${dotfile}
   ln -fs $(pwd)/${dotfile} ~/.${dotfile}
done
