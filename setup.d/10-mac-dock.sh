#!/bin/sh

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

set -x

# Faster Dock
defaults write com.apple.Dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0.5

#Set tile size
defaults write com.apple.dock largesize -float 150.000000

#Show active apps only (//TODO this may be why I've had issues with keeping apps in my dock previously)
#defaults write com.apple.dock static-only -bool TRUE; 

#Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Dim hidden apps
defaults write com.apple.dock showhidden -bool true

# Kill the dock, so that it will restart and all changes should be observed
killall Dock
