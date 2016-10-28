#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

###############################################################################
# Mice, keyboard, etc                                                         #
###############################################################################

# Set a blazingly fast keyboard repeat rate
#defaults write NSGlobalDomain KeyRepeat -int 0

# disable Natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
