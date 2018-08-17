#!/bin/bash

mkdir ~/.vim
cp -R vim/* ~/.vim/
cp vimrc ~/.vimrc
cp vimrc.before ~/.vimrc.before
cp ctags ~/.ctags
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone git://github.com/tpope/vim-rsi.git ~/.vim/bundle/vim-rsi
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/tpope/vim-endwise.git ~/.vim/bundle/vim-endwise

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/dispatch.git
vim -u NONE -c "helptags dispatch/doc" -c q

mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
vim -u NONE -c "helptags surround/doc" -c q

cd ~/.vim/bundle
git clone git://github.com/tpope/vim-sensible.git
