#!/usr/bin/env bash

log() { echo -e "\e[0;33m${1}\e[0m"; }

# Ask for the administrator password upfront.
sudo -v

log 'Install OS X Software Updates...'
sudo softwareupdate -i -a

log 'Update Homebrew...'
brew update
brew upgrade --all

log 'Cleanup Homebrew Cache...'
brew cleanup --force -s
rm -rfv $(brew --cache)/*
brew tap --repair

log 'Check if my system is ready to brew...'
brew doctor

log 'Update Composer with dependencies...'
composer self-update
composer global update --no-dev --prefer-dist

log 'Update NPM with dependencies...'
npm install --global --quiet npm@latest

# Revoke sudo access again.
sudo -k