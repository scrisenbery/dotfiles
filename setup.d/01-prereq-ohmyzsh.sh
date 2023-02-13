#! /bin/sh
# Install Oh-My-ZSH

if ! [ -d ~/.oh-my-zsh ]; then
  echo "Install oh-my-zsh/n/n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "oh-my-zsh already installed./n/n"
fi

# //TODO if OMZ was installed before the script, this breaks the zshrc link
# Restore .zshrc after OMZ installation
if [ -e ~/.zshrc.pre-oh-my-zsh ]; then
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi
