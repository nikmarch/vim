#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get update
  sudo apt-get install exuberant-ctags
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew reinstall ctags
  brew reinstall vim
fi

sudo mkdir ~/.vim
sudo cp -R vim/* ~/.vim/
sudo cp vimrc ~/.vimrc
sudo cp vimrc.before ~/.vimrc.before
sudo cp ctags ~/.ctags
sudo git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
sudo git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
sudo git clone git://github.com/tpope/vim-rsi.git ~/.vim/bundle/
