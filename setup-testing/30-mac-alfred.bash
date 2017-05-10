#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

#TODO Update/Review
# Let's store some variables so we don't do a lot of copypasta
ALFRED_WORKFLOWS_DIR="$HOME/Library/Application Support/Alfred 2/Alfred.alfredpreferences/workflows"
ALFRED_WORKFLOWS_GIT="https://bitbucket.org/Juxtaposedwords/alfred-workflows"

if ! [ -d "$ALFRED_WORKFLOWS_DIR"/.git ]; then
  sudo rm -r "$ALFRED_WORKFLOWS_DIR"
  git clone "$ALFRED_WORKFLOWS_GIT" "$ALFRED_WORKFLOWS_DIR"
  cd "$ALFRED_WORKFLOWS_DIR"
  git submodule update --init --recursive
else 
  cd "$ALFRED_WORKFLOWS_DIR"
  git reset --hard origin/master
fi

# //TODO make sure to update to Alfred 3 --- also make sure Alfred is installed before this
open "$HOME/Applications/Alfred\ 2.app"

