#!/bin/bash

brew reinstall ctags
brew reinstall vim
mkdir ~/.vim
cp -R dotvim/* ~/.vim/

cp vimrc ~/.vimrc
cp vimrc.before ~/.vimrc.before

cp ctags ~/.ctags
