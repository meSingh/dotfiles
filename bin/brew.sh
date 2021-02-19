#!/usr/bin/env bash

install "Homebrew"


if test ! $(which brew); then
  install "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  # Install Homebrew, Cask and Versions tap.
  install "Homebrew taps and extensions:"
  brew tap homebrew/cask
  brew tap homebrew/cask-versions
else
  log "Homebrew is already installed. Skipping.."
fi


# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)


ZSH=~/.oh-my-zsh

if [ -d "$ZSH" ]; then
  log "Oh My Zsh is already installed. Skipping.."
else
  install "zsh @ Oh My Zsh..."
  brew install zsh zsh-completions
  chsh -s $(which zsh)
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
  brew install zsh-syntax-highlighting
  rm -f ~/.zcompdump; compinit
  # TODO: 
  todo "Add zsh-completions code in .zshrc"

  ## To install ZSH themes & aliases
  log "Copying ZSH themes & aliases..."
  log "Check .aliases file for more details."
  cp ./.aliases ~/.aliases ## Copy aliases
  cp ./.zshrc ~/.zshrc ## Copy zshrc configs
  open ./imports/Clovis-iTerm2-Color-Scheme.itermcolors
  open ./imports/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf
  # cp oh-my-zsh/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme   ## Copy custom dracula theme
  # cp oh-my-zsh/z.sh ~/z.sh                                               ## Copy z.sh autocompletion file

  source ~/.zshrc
fi




install "GNU core utilities (those that come with macOS are outdated)"
Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"



# Install GnuPG to enable PGP-signing commits.
brew install gnupg

install "Dropbox - Beta"
brew install dropbox-beta
open /Applications/Dropbox.app
# TODO: 
todo "Login and setup sync files in Dropbox"


install "Iterm 2"
brew cask install iterm 
open /Applications/iTerm.app
# In Preferences > Profiles > Keys, select Natural Text Editing;
# makes Option-Left/Right work.


install "Visual Studio Code - Insiders Edition"
brew cask install visual-studio-code-insiders 
open /Applications/Visual\ Studio\ Code\ -\ Insiders.app
# TODO: 
todo "Login to VS Code Sync"


install "Docker - Edge (aka Beta)"
brew cask install docker-edge
open /Applications/Docker.app
todo "Login into Docker Cloud"


install "Skype - Preview (aka Beta)"
brew cask install skype-preview
open /Applications/Skype.app
todo "Login into Skype and Set Status as invisble"


install "1Password - Beta"
brew cask install 1password-beta
todo "Login into 1Password using mobile app"


install "Various Utilities"

brew cask install appcleaner
brew cask install imageoptim
brew cask install vagrant
brew cask install virtualbox
brew cask install caret
brew cask install vlc
brew cask install spotify
brew cask install slack
brew cask install postman
brew cask install notion
brew cask install moom
brew cask install backblaze
brew cask install backblaze-downloader
brew cask install workflowy
brew cask install figma-beta
brew cask install gitkraken
brew cask install whatsapp
brew cask install sip
brew cask install airtable
brew cask install tableplus
brew cask install safari-technology-preview
brew cask install brave-browser-nightly

open /Applications/Notion.app
open /Applications/Spotify.app
open /Applications/Slack.app
open /usr/local/Caskroom/backblaze/7.0.2.470/bzdoinstall.app
open /Applications/Postman.app
open /Applications/Workflowy.app
open /Applications/Moom.app
open /Applications/Gitkraken.app
open /Applications/WhatsApp.app
open /Applications/Sip.app
open /Applications/Airtable.app
open /Applications/TablePlus.app
open /Applications/Brave Browser Nightly.app

todo "Login into Spotify, Slack, Backblaze, Notion, Workflowy, Figma, Gitkraken, WhatsApp, Airtable & Postman"


brew cask install microsoft-edge-dev
brew cask install firefox-nightly

open /Applications/Microsoft Edge Dev.app
open /Applications/Firefox Nightly.app


install "Alfred 4"
brew cask install alfred
open /Applications/Alfred 4.app
todo "Open Alfred, set activation key, and set the pref direcotry in -> Advanced -> Syncing"


# Remove outdated versions from the cellar.
brew cleanup