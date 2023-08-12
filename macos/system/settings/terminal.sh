#!/bin/zsh

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use Pro Theme
defaults write com.apple.Terminal "Startup Window Settings" -string Pro
defaults write com.apple.Terminal "Default Window Settings" -string Pro

# Use KSH
defaults write com.apple.terminal "Shell" -string "$(brew --prefix)/bin/zsh93";

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Update every profile in
osascript <<'END'
tell application "Terminal"
	set ProfilesNames to name of every settings set
	repeat with ProfileName in ProfilesNames
		set font name of settings set ProfileName to "SF Mono"
		set font size of settings set ProfileName to 16
		set number of rows of settings set ProfileName to 40
		set number of columns of settings set ProfileName to 128
		set font antialiasing of settings set ProfileName to true
	end repeat
end tell
END
