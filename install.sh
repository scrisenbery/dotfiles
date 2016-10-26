#!/bin/bash
set -ev
# //TODO Update for issue #2
# Copy config.d files to home directory
copy_file() {
  # //TODO Will PWD work as intended here?
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"
  # //TODO TEST
  backup=${HOME}/$(basename "${target}")
  targetbase=$(basename "${target}")

  mkdir ${HOME}/.dotbak

  if [ -e $target ] ; then
    if [ ! -d $target ] ; then
      echo "Update\t$target"
      #Backup original files if they exist
      mv $target ${HOME}/.dotbak/$targetbase.bak
      cp ${source} ${target}
    fi
  elif [ -e $backup ] ; then
    if [ ! -d $backup ] ; then
      echo "Update\t$backup"
      #Backup original files if they exist in HOME dir even if dotfiles locates them elsewhere
      # //TODO Will this work for subdirectory-located files?
      mv $backup ${HOME}/.dotbak/$targetbase.bak
      cp ${source} ${target}
    fi
  else
    echo "Install\t$target"
    cp ${source} ${target}
  fi
}

for i in ${PWD}/config.d/_*
do
  copy_file $i
done

# //TODO Add debug output

# Iterate over all the shell scripts in setup.d and run them
for file in ${PWD}/setup.d/*.sh; do
  bash $file
done

