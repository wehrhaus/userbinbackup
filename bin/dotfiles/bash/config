# set prompt to display as:
# Username:WorkingDirectory [VersionControlShortName:Revision]
# additionally a + will be added if modified files exist
# PS1="\n\u:\w [\$(vcprompt --format-svn %s:%r%m)] \n→ "

# set prompt to display as:
# username:working directory
# →
#PS1="\n\e[1;34m\u\e[m:\w\n→ "

# set prompt to display as:
# wehrhaus:working directory
# →
# PS1="\n\e[1;34mwehrhaus\e[m:\w\n👽 "

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Show remaining battery time; hide percentage
defaults write com.apple.menuextra.battery ShowPercent -string "NO"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Show the ~/Library folder
chflags nohidden ~/Library
