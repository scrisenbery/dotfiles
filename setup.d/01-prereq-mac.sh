#!/bin/sh

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
   echo "Installing homebrew..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# //TODO update path for gmac branch
#This should be managed through env vars, see also zshrc

# Ask for the administrator password upfront.
sudo -v

brew doctor

# //TODO Add debug output
# //TODO Add comments
# Setup Homebrew Cask.
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/services
brew upgrade
brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup

# //TODO
# Move /usr/local/bin to the top of the path
sudo sed -ie  '/^\/usr\/local\/bin/!H;//p;$!d;g;s/\n//' /etc/paths
