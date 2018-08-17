#!/bin/bash

sudo mkdir ~/.vim
sudo cp -R vim/* ~/.vim/
sudo cp vimrc ~/.vimrc
sudo cp vimrc.before ~/.vimrc.before
sudo cp ctags ~/.ctags
sudo git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
sudo git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
sudo git clone git://github.com/tpope/vim-rsi.git ~/.vim/bundle/vim-rsi
sudo git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
sudo git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
sudo git clone https://github.com/tpope/vim-endwise.git ~/.vim/bundle/vim-endwise

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/dispatch.git
vim -u NONE -c "helptags dispatch/doc" -c q

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q
