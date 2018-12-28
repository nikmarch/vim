#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get update
  sudo apt-get install exuberant-ctags
  sudo apt-get install vim
elif [[ "$OSTYPE" == "darwin"* ]]; then
#  brew update
#  brew reinstall ctags
#  brew reinstall vim
echo "Breeeeewwwww"
fi

mkdir -p ~/.vim/backups
cp vimrc ~/.vimrc
cp -R  vim ~/.vim

# install plugins
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
git clone git clone git://github.com/tpope/vim-endwise.git ~/.vim/bundle/vim-endwise
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
# vim -u NONE -c "helptags vim-fugitive/doc" -c q
git clone https://tpope.io/vim/sensible.git ~/.vim/bundle/sensible
# vim -u NONE -c "helptags sensible/doc" -c q
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/dispatch.git
# vim -u NONE -c "helptags dispatch/doc" -c q
cd -
git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails
# vim -u NONE -c "helptags vim-rails/doc" -c q
