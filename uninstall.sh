#!/bin/sh

cd config.d
for i in _*
do
  rm -rf "${HOME}/${i/_/.}"
done

# //TODO Restore backups? Note, this depends on the backup process preserving directory structure
