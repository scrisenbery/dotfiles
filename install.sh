#!/bin/sh

# //TODO decide fully if this is a good design decision
# Make symbolic links to home folder
link_file() {
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"

  if [ -e $target ] ; then
    if [ ! -d $target ] ; then
      echo "Update\t$target"
      mv $target $target.bak
      ln -sf ${source} ${target}
    fi
  else
    echo "Install\t$target"
    ln -sf ${source} ${target}
  fi
}

for i in _*
do
  link_file $i
done

# //TODO vim package manager decision 
# Vim Package Manager Install
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]
then
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# Install Oh-My-ZSH
if [ ! -d $HOME/.vim/bundle/neobundle.vim ]
then
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# //TODO NOOOOOOOOOOOOOOOOWHY
# Install npm "global" modules
npm install
