#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -R vim ~/.vim
mkdir -p ~/.vim/backups
cp vimrc ~/.vimrc

# install plugins
git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab
git clone git://github.com/godlygeek/tabular.git ~/.vim/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone git://github.com/tpope/vim-endwise.git ~/.vim/bundle/vim-endwise
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone https://github.com/tpope/vim-rhubarb.git ~/.vim/bundle/vim-rhubarb
# vim -u NONE -c "helptags vim-fugitive/doc" -c q
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/surround.git
git clone https://tpope.io/vim/sensible.git
git clone https://tpope.io/vim/commentary.git
# vim -u NONE -c "helptags dispatch/doc" -c q
# vim -u NONE -c "helptags surround/doc" -c q
# vim -u NONE -c "helptags sensible/doc" -c q
cd -
# git clone https://github.com/tpope/vim-rails.git ~/.vim/bundle/vim-rails
# vim -u NONE -c "helptags vim-rails/doc" -c q
git clone https://github.com/moll/vim-node.git ~/.vim/bundle/node
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone https://github.com/jparise/vim-graphql.git ~/.vim/bundle/vim-graphql
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
mkdir -p ~/.vim/pack/coc/start
cd ~/.vim/pack/coc/start
curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
cd -
# Tmux section
cd
rm -rf .tmux*
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cd -
cp tmux.conf ~/.tmux.conf.local
cp ctags ~/.ctags
