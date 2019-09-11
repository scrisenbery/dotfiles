#!/bin/sh

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

  echo "Source is ${source}"
  echo "Target is ${target}"
  echo "Backup is ${backup}"
  echo "Basename is ${targetbase}"



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

#Make directory for backing up existing dotfiles to prevent overwrites
backupdir="${HOME}/.dotbak"
# //TODO look at cleaning up vars here and in link_file()
if [[ ! -e $backupdir ]]; then
    mkdir $backupdir
elif [[ ! -d $backupdir ]]; then
    echo "$backupdir already exists but is not a directory" 1>&2
fi

cd config.d
for i in _*
do
  link_file $i
done
cd ../setup.d
# //TODO Add debug output

# //TODO Delete backup dir if nothing was backed up
## if (backup dir empty) { rmdir $backupdir } [should consider permissions and errors]


# TEST - Update path to include Homebrew
#export PATH="$HOME/homebrew/bin:$PATH"

# Iterate over all the shell scripts in setup.d and run them
for file in *.sh; do
  /bin/sh $file

#/bin/sh 01-prereq-homebrew.sh
#/bin/sh 02-prereq-brews.sh
done

