#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# //TODO Not sure how this ensures xcode? Will it need to be managed out of dotfiles?
# make sure we have xcode...homebrew requires
if test ! $(which brew); then
   echo "Installing homebrew..."
   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
# //TODO update path for gmac
# Ask for the administrator password upfront.
sudo -v

brew doctor

# Setup Homebrew Cask.
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/services
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup

# //TODO Duplicate from above?
# Install more recent versions of some OS X tools
brew tap homebrew/dupes

# //TODO Duplicate from above?
# Upgrade any already-installed formulae.
brew upgrade

# //TODO Duplicate from above?
# Make sure we’re using the latest Homebrew.
brew update


# //TODO this whole damn thing

LOCALBASH="/usr/local/bin/bash"
if ! grep -q $LOCALBASH /etc/shells; then
  echo $LOCALBASH | sudo tee -a /etc/shells
  sudo chsh -s $LOCALBASH $USER
fi

# Move /usr/local/bin to the top of the path
sudo sed -ie  '/^\/usr\/local\/bin/!H;//p;$!d;g;s/\n//' /etc/paths
