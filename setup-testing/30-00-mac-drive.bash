#!/bin/bash

# //TODO Not sure what this gets me

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0
open $HOME/Applications/Google\ Drive.app
