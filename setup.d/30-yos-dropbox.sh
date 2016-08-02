#!/bin/bash
# Ignore if we're not on OSX

# //TODO what does this get me?

[[ "$OSTYPE" =~ ^darwin ]] || exit 0
open $HOME/Applications/Dropbox.app
