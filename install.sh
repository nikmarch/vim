!#/bin/bash

#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get update
  sudo apt-get install exuberant-ctags
  sudo apt-get install vim
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew reinstall ctags
  brew reinstall vim
fi

mkdir ~/.vim/backups
cp vimrc ~/.vimrc
cp -R  vim ~/.vim

