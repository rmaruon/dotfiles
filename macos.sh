#!/usr/bin/env bash

# ref: https://mths.be/macos

# Close any open System Preferences panes, to prevent them from overriding
# settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v


# Trackpad

# enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#
defaults write -g com.apple.trackpad.scaling -float 10


# Keyboard

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
# Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3


# Finder

# disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true
# don't show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
# show tab view
defaults write com.apple.finder ShowTabView -bool true
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
#
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarSharedSectionDisclosedState -bool true
#
defaults write com.apple.finder QLEnableTextSelection -bool true

killall Finder


# Dock, Dashboard

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50
# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"
# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true
# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false
# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

killall Dock


# etc

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# Disable screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0
# Show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# Display the battery percentage from the menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Date options
defaults write com.apple.menuextra.clock 'DateFormat' -string 'M\u6708d\u65e5(EEE)  H:mm:ss'
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Automatically quit the printer app once the print jobs are completed
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Require password immediately after the computer went into
# sleep or screen saver mode
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
#
defaults -currentHost write -globalDomain AppleFontSmoothing -int 3
