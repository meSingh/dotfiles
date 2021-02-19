#!/usr/bin/env bash

if test ! $(which nvm); then
  install "NVM - Node Version Manager"

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash

  export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

  echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> ~/.zshrc

  source ~/.zshrc

  ## Set npm global config
  npm config set init.author.name "Gokulakrishnan Kalaikovan" ## Replace it with your name
  npm config set init.author.email "krishnangokul9@gmail.com" ## Replace it with your email id
else
  log "NVM is already installed. Skipping.."
fi


install "Node Version: ${NODE_VERSION}"
nvm install ${NODE_VERSION}

install "Latest version of NPM:"
npm install -g npm@latest

install "Yarn Package Manager"
npm install -g yarn

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer --version=1.10.17
php -r "unlink('composer-setup.php');"
chmod +x /usr/local/bin/composer


composer global require laravel/valet

valet install

brew install go

