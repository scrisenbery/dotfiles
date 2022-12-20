#!/bin/sh

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# //TODO why
# Ask for the administrator password upfront.
sudo -v

# Make sure we’re using the latest Homebrew.
brew update

# Install Hammerspoon (used for ShiftIt)
brew install hammerspoon --cask


# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
#brew install coreutils # //TODO

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
#brew install findutils --with-default-names # //TODO

# Install more recent versions of some OS X tools and #JustSysAdminThings //TODO
#brew install gnu-indent --with-default-names
#brew install gnu-sed --with-default-names
#brew install gnutls
#brew install gnu-tar --with-default-names
#brew install gnu-which --with-default-names
#brew install grep --with-default-names
#brew install gawk
#brew install tree
#brew install htop

# Install some recreational stuff
#brew install terminal-notifier

# //TODO terraform, jq, etc

# Remove outdated versions from the cellar.
brew cleanup
