#!/bin/sh

# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if test ! $(which brew); then
   echo "Installing homebrew..."
   # Ref: https://brew.sh/
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

   # Specific directory installation
   # Ref: https://github.com/Homebrew/brew/blob/master/docs/Installation.md#user-content-alternative-installs
   #mkdir -p ~/homebrew
   #curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/homebrew

   # //TODO Add test for afterwards and exit on failed test
fi

# Ask for the administrator password upfront.
sudo -v

brew doctor

brew analytics off

# //TODO Add debug output
# //TODO Add comments
brew upgrade
brew update
brew cleanup

# //TODO
# Move /usr/local/bin to the top of the path
#sudo sed -ie  '/^\/usr\/local\/bin/!H;//p;$!d;g;s/\n//' /etc/paths
