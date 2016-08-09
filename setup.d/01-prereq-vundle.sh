#! /bin/sh
# Vim Package Manager Install

echo "--------"
echo "Installing Vundle"
echo "--------"

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
