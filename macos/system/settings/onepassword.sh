#!/usr/bin/env zsh
set -Eeuo pipefail

# Show 1Password in the menu bar
defaults write com.agilebits.onepassword7 "MASPreferences Selected Identifier View" -string "General"
defaults write com.agilebits.onepassword7 ShowStatusItem -bool false

# Show rich icons
defaults write com.agilebits.onepassword7 ShowRichIcons -bool true

# Show item count in sidebar
defaults write com.agilebits.onepassword7 ShowItemCounts -bool false

# Format secure notes using Markdown
defaults write com.agilebits.onepassword7 EnableMarkdown -bool true

# Conceal passwords
defaults write com.agilebits.onepassword7 ConcealPasswords -bool true

# Lock on sleep
defaults write com.agilebits.onepassword7 LockOnSleep -bool true

# Lock when screen saver is activated
defaults write com.agilebits.onepassword7 LockOnScreenSaver -bool true

# Lock when main window is closed
defaults write com.agilebits.onepassword7 LockOnMainAppExit -bool false

# Lock when fast user switching
defaults write com.agilebits.onepassword7 LockOnUserSwitch -bool true

# Lock after computer is idle for 5 minutes
defaults write com.agilebits.onepassword7 LockOnIdle -bool true
defaults write com.agilebits.onepassword7 LockTimeout -int 5

# Clear clipboard contents after 45 secondes
defaults write com.agilebits.onepassword7 ClearPasteboardAfterTimeout -bool true
defaults write com.agilebits.onepassword7 PasteboardClearTimeout -int 45

# Check for compromised websites
defaults write com.agilebits.onepassword7 watchtowerService -bool true

# Check for vulnerable passwords
defaults write com.agilebits.onepassword7 compromisedPasswordServiceV2 -bool true

# Check for two-factor authentication
defaults write com.agilebits.onepassword7 twoFactorService -bool true

# Ask before checking for a secure connection
defaults write com.agilebits.onepassword7 watchtowerMakeHTTPSAlwaysAskForConsent -bool true

# Always keep 1Password Extension Helper running
defaults write com.agilebits.onepassword7 KeepHelperRunning -bool true

# Show inline menu in Safari
defaults write com.agilebits.onepassword7 OPPrefShowSafariInlineMenu -bool true

# Automaticcaly show inline menu when selecting a field
defaults write com.agilebits.onepassword7 OPPrefShowSafariInlineMenuAutomatically -bool true

# Detect new usernames and passwords and offer to save them
defaults write com.agilebits.onepassword7 autosave -bool true

# Automaticcaly copy one-time passwords
defaults write com.agilebits.onepassword7 CopyTOTPToClipboard -bool true

# Notifications: One-time passwords
defaults write com.agilebits.onepassword7 OPPreferencesNotifyOfTOTPCopy -bool true

# Notifications: Vault access
defaults write com.agilebits.onepassword7 OPPreferencesNotifyVaultAddedRemoved -bool true

# Notifications: Watchdog alerts
defaults write com.agilebits.onepassword7 OPPreferencesNotifyCompromisedWebsites -bool true