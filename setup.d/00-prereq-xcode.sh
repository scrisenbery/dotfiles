# //TODO Look for better ways to do this
# //TODO Confirm XCode behavior and that this works as expected, especially around what happens if XCode is already installed

# Pulled from remote-setup.sh from @Juxtaposedwords

if [[ "$OSTYPE" =~ ^darwin ]]; then

  xcode-select --install

  # Ask for administrator password to provide a way for the script to not continue until XCode actions are complete
  echo "Do not enter your password until XCode installation is complete and the User Agreement has been accepted."
  echo "This is required for Homebrew to work."
  echo "XCode should have opened another window to continue its setup."
  echo "Once XCode setup is complete, enter your administrator password:"

  sudo -v

fi

