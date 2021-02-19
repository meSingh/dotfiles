#!/usr/bin/env bash
#/ Usage: bin/strap.sh [--debug]
#/ Install development dependencies on Mac OS X.

# Setup default configurations for this script
source $(dirname $0)/config.sh


# Install the Xcode Command Line Tools if Xcode isn't installed.
DEVELOPER_DIR=$("xcode-select" -print-path 2>/dev/null || true)
[ -z "$DEVELOPER_DIR" ] || ! [ -f "$DEVELOPER_DIR/usr/bin/git" ] && {
  log "Installing the Xcode Command Line Tools:"
  CLT_PLACEHOLDER="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"
  sudo touch "$CLT_PLACEHOLDER"
  CLT_PACKAGE=$(softwareupdate -l | \
                grep -B 1 -E "Command Line (Developer|Tools)" | \
                awk -F"*" '/^ +\*/ {print $2}' | sed 's/^ *//' | head -n1)
  sudo softwareupdate -i "$CLT_PACKAGE"
  sudo rm -f "$CLT_PLACEHOLDER"
  ok
}

# Check if the Xcode license is agreed to and agree if not.
/usr/bin/xcrun clang 2>&1 | grep $Q license && {
  if [ -n "$STRAP_INTERACTIVE" ]; then
    logn "Asking for Xcode license confirmation:"
    sudo xcodebuild -license
    ok
  else
    abort 'Run `sudo xcodebuild -license` to agree to the Xcode license.'
  fi
}



# Setup SSH keys
# Add SSH keys to .ssh folder first
chmod 400 ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa


git config --global user.email "$EMAIL"
git config --global user.name "$NAME"


mkdir ~/.dotfiles
cd  ~/.dotfiles
git clone git@github.com:meSingh/dotfiles.git .


# source $(dirname $0)/macos.sh
source $(dirname $0)/brew.sh
source $(dirname $0)/dev-setup.sh







###############################################################################
# Work Setup Specific for meSingh                                             #
###############################################################################


cd ~
mkdir Sites
mkdir Sites/Jobs
mkdir Sites/Projects



# Revoke sudo access again
sudo -k


echo "🍺  Thats all, Done. Note that some of these changes require a logout/restart to take effect."