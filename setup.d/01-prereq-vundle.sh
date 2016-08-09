#!
# Vim Package Manager Install
INSTALLING="Vundle"

echo "--------"
echo "Installing " + $INSTALLING
echo "--------"

if [ ! -d $HOME/.vim/bundle/Vundle.vim ]
then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
