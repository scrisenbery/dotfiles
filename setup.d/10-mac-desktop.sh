#!/bin/sh

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

set -x


##############################
# Dock                       #
##############################
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

##############################
# Hot corners                #
##############################

# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
# https://blog.jiayu.co/2018/12/quickly-configuring-hot-corners-on-macos/
# Modifier means key combos to trigger, 0 means none

# Top left
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

######
# Kill the dock, so that it will restart and all changes should be observed
killall Dock