#!/bin/sh
# It's doing a sed replacement. Given file path 'i' replace any _ with .

for i in ${PWD}/config.d/_*
do
  rm -rf "${HOME}/${i/_/.}"
done

# //TODO Restore backups? Note, this depends on the backup process preserving directory structure
