#!/usr/bin/env bash
#/ Usage: bin/strap.sh [--debug]
#/ Install development dependencies on Mac OS X.


NAME="Mandeep Singh"
EMAIL="mesingh90@gmail.com"

NODE_VERSION="12"

###############################################################################
# Optional configurations that you may not need to change                     #
###############################################################################


# Regular Colors
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
# No Color
NC='\033[0m' 

TEXT_BOLD=$(tput bold)
TEXT_NORMAL=$(tput sgr0)


###############################################################################
# Default functions and sudo setup                                            #
###############################################################################

abort() { echo "!!! $@" >&2; exit 1; }
log()   { echo "--> $@"; }
logn()  { printf -- "--> $@ "; }

install() { echo "--> Installing: ${YELLOW}$@${NC}"; }
todo()  { echo "${GREEN}${TEXT_BOLD}--> TODO:${TEXT_NORMAL}  --  ${GREEN}$@${NC}"; }
ok()  { echo "OK"; }


# Initialise sudo now to save prompting later.
log "Enter your password (for sudo access):"
sudo -k
sudo /usr/bin/true
ok