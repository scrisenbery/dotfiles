#!/bin/sh
# //TODO Investigate why the /_/.  is being highlighted as if it's a syntax error (yet appears to work fine); this also applies to install script (but no TODO there because lazy)
# It's doing a sed replacement. Given file path 'i' replace any _ with .

for i in ${PWD}/config.d/_*
do
  rm -rf "${HOME}/${i/_/.}"
done

# //TODO Restore backups? Note, this depends on the backup process preserving directory structure
