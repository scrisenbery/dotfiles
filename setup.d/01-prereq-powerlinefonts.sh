# /bin/sh
# Install Powerline Fonts

set -v

echo "--------"
echo "Installing Powerline Fonts"
echo "--------"

git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts
sh /tmp/powerline-fonts/install.sh

echo "Cleaning up temp dir /tmp/powerline-fonts"
rm -rf /tmp/powerline-fonts

echo "Installed Powerline Fonts"
