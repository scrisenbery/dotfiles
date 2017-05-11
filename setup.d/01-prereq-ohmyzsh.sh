#! /bin/sh
# Install Oh-My-ZSH
echo "Install oh-my-zsh/n/n"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Restore .zshrc after OMZ installation
if [ -e ~/.zshrc.pre-oh-my-zsh ]; then
  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
fi
