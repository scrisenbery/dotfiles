#!/bin/bash

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# //TODO why
# Ask for the administrator password upfront.
sudo -v

# Make sure we’re using the latest Homebrew.
brew update

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils --with-default-names

# Install more recent versions of some OS X tools and #JustSysAdminThings
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnutls --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-which --with-default-names
brew install grep --with-defualt-names
brew install gawk
brew install tree
brew install htop

# Install some recreational stuff
brew install terminal-notifier

# This will install all the stuff we need for reasons
brew cask install google-chrome
brew cask install dropbox
brew cask install shiftit
brew cask install alfred
brew cask install google-drive
brew cask install skype
brew cask install slack
brew cask install wireshark
brew cask install vlc

# Work stuff
brew install net-snmp


# Remove outdated versions from the cellar.
brew cleanup

# //TODO this whole damn thing

LOCALBASH="/usr/local/bin/bash"
if ! grep -q $LOCALBASH /etc/shells; then
  echo $LOCALBASH | sudo tee -a /etc/shells
  sudo chsh -s $LOCALBASH $USER
fi
