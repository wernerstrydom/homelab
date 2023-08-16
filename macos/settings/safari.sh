#!/usr/bin/env zsh
set -Eeuo pipefail
defaults write com.apple.Safari ActivitiesStartExpanded -boolean false
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari AutoOpenSafeDownloads -int 0
defaults write com.apple.Safari Command1Through9SwitchesTabs -bool true
defaults write com.apple.Safari CommandClickMakesTabs -bool true
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari HomePage -string ""
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
defaults write com.apple.Safari NewTabBehavior -int 0
defaults write com.apple.Safari NewTabBehavior -int 1
defaults write com.apple.Safari NewWindowBehavior -int 0
defaults write com.apple.Safari NewWindowBehavior -int 1
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -int 0
defaults write com.apple.Safari OpenNewTabsInFront -bool false
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool false
defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 2
defaults write com.apple.Safari SavePanelFileFormat -int 0
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -int 1
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari ShowFavoritesBar-v2 -bool false
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowOverlayStatusBar -bool true
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari ShowStatusBarInFullScreen -bool true
defaults write com.apple.Safari SidebarViewModeIdentifier -string  "Bookmarks"
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari TabCreationPolicy -int 2
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari WebIconDatabaseEnabled -bool false
defaults write com.apple.safari WebKitDNSPrefetchingEnabled -boolean true
defaults write com.apple.Safari WebKitPreferences.tabFocusesLinks -bool true
defaults write com.apple.SafariTechnologyPreview ShowFrequentlyVisitedSites -bool false

defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write -g WebKitDeveloperExtras -bool YES
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari WebKitPreferences.defaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false

defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
defaults write com.apple.Safari ExtensionsEnabled -bool true
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

defaults write com.apple.Safari BlockStoragePolicy -int 2
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 1
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 1

defaults write com.apple.Safari SafariGeolocationPermissionPolicy -int 0

defaults write com.apple.Safari CanPromptForPushNotifications -bool false

defaults write com.apple.Safari DownloadsClearingPolicy -int 2

defaults write com.apple.Safari HistoryAgeInDaysLimit -int 7

defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool false
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false
defaults write com.apple.Safari WebKitMinimumFontSize -int 9
defaults write com.apple.Safari WebKitPreferences.minimumFontSize -int 9

defaults write com.apple.Safari PrintHeadersAndFooters -bool false

defaults write com.apple.Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds" -bool false