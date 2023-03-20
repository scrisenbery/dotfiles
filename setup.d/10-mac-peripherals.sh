#!/bin/sh
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

set -x

###############################################################################
# Mice, keyboard, etc                                                         #
###############################################################################

# Set a blazingly fast keyboard repeat rate
#defaults write NSGlobalDomain KeyRepeat -int 0

# Disable Natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
