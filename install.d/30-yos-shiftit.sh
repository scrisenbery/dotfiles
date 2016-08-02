#!/bin/bash
# Ignore if we're not on OSX
[[ "$OSTYPE" =~ ^darwin ]] || exit 0
# //TODO

# //TODO Explore if I can update the hotkeys during setup
open ~/Applications/ShiftIt.app
# This enables shiftit in security preferences, no seriously it does.
sudo sqlite3 "/Library/Application Support/com.apple.TCC/TCC.db" 'update access set allowed="1" where client like "%shiftit%";'
