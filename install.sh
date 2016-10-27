#!/bin/bash

# set is a bash built-in command to manage bash options: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# -e = Exit immediately on non-zero status
# -v = Print shell input lines as they are read
set -ev


# Symlink config.d files to home directory
link_file() {
  # //TODO Will PWD work as intended here?
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"
  backup=${HOME}/$(basename "${target}")
  targetbase=$(basename "${target}")

  mkdir ${HOME}/.dotbak

  if [ -e $target ] ; then
    if [ ! -d $target ] ; then
      echo "Update\t$target"
      #Backup original files if they exist
      mv $target ${HOME}/.dotbak/$targetbase.bak
    fi
  elif [ -e $backup ] ; then
    if [ ! -d $backup ] ; then
      echo "Update\t$backup"
      #Backup original files if they exist in HOME dir even if dotfiles locates them elsewhere
      # //TODO Will this work for subdirectory-located files?
      mv $backup ${HOME}/.dotbak/$targetbase.bak
    fi
  else
    echo "Install\t$target"
  fi

  # -s = symbolic link
  # -i prompts the user in case of conflicts. These should be prevented by the backup process.
  # -v for verbose output. This is likely temporary for testing purposes.
  ln -siv ${source} ${target}

}

for i in ${PWD}/config.d/_*
do
  link_file $i
done

# //TODO Add debug output

# Iterate over all the shell scripts in setup.d and run them
for file in ${PWD}/setup.d/*.sh; do
  bash $file
done

