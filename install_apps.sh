#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get update
  sudo apt-get install exuberant-ctags
  sudo apt-get install vim
  sudo apt-get install tmux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew update
  brew reinstall ctags
  brew reinstall vim
  npm install -g git+https://github.com/ramitos/jsctags.git
  brew install tmux
  brew install fd
  brew install selecta
  brew install ag
fi
