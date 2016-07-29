#!/bin/sh
# //TODO Investigate why the /_/.  is being highlighted as if it's a syntax error (yet appears to work fine); this also applies to install script (but no TODO there because lazy)
for i in _*
do
  rm -fr "${HOME}/${i/_/.}"
done
