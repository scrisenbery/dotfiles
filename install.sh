#!/bin/bash

# //TODO Update for issue #2
# Make symbolic links to home folder
copy_file() {
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"

  if [ -e $target ] ; then
    if [ ! -d $target ] ; then
      echo "Update\t$target"
      # //TODO This is backing up the original file if it exists. Need to store in a more specific location I think
      mv $target $target.bak
      cp ${source} ${target}
    fi
  else
    echo "Install\t$target"
    cp ${source} ${target}
  fi
}

for i in _*
do
  copy_file $i
done


set -ev

# here we go and iterate over all the shell scripts in the install.d file and run them
for file in $HOME/.dotfiles/install.d/*.sh; do
  bash $file
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
  bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# //TODO break out installs into setup
