#!/bin/bash
set -ev
# //TODO Update for issue #2
# Copy to home folder
copy_file() {
  source="${PWD}/$1"
  target="${HOME}/${1/_/.}"

  mkdir ${HOME}/.dotbak/

  if [ -e $target ] ; then
    if [ ! -d $target ] ; then
      echo "Update\t$target"
      # //TODO This is backing up the original file if it exists. Need to store in a more specific location I think
      mv $target ${HOME}/.dotbak/$target.bak
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


# here we go and iterate over all the shell scripts in setup.d and run them
for file in ${PWD}/setup.d/*.sh; do
  bash $file
done

