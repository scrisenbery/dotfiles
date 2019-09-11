#! /bin/sh
# Vim Package Manager Install

# //TODO Add checks for issues? (i.e. vim missing, dotfiles missing, etc)

set -v

echo "--------"
echo "Installing Vundle"
echo "--------"

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Install vim plugins via command line
vim +PluginInstall +qall
