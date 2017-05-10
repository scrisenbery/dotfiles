#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
 while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Ensure brew is installed
if test ! $(which brew); then
   echo "Error caught in: " + `basename "$0"` + "; brew not installed" 1>&2
   exit 1
fi

# //TODO Necessary? Per branch maybe?
# Ask for the administrator password upfront.
sudo -v

# Make sure we’re using the latest Homebrew.
brew update

brew install zsh # //TODO
brew install tmux
brew install vim --with-override-system-vi # //TODO
brew install git # //TODO
brew install bash # //TODO


brew install bash-completion2
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install wget


# Remove outdated versions from the cellar.
brew cleanup
