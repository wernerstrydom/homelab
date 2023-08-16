#!/usr/bin/env zsh
set -Eeuo pipefail

sudo defaults write /Library/Preferences/com.apple.timezone.auto Active -bool YES
sudo defaults write /private/var/db/timed/Library/Preferences/com.apple.timed.plist TMAutomaticTimeOnlyEnabled -bool YES
sudo defaults write /private/var/db/timed/Library/Preferences/com.apple.timed.plist TMAutomaticTimeZoneEnabled -bool YES
sudo defaults write com.apple.menuextra.clock IsAnalog -bool false
sudo defaults write com.apple.menuextra.clock FlashDateSeparators -bool true
sudo defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"

STATUS=$(sudo systemsetup -getusingnetworktime | awk '{print $3}')
if [ "$STATUS" != "On" ]; then
  sudo systemsetup -setusingnetworktime on
fi

