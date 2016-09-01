#!/bin/sh

# install cask for binaries
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew tap homebrew/boneyard

# install binaries
brew cask install \
    firefoxdeveloperedition \
    iterm2 \
    sublime-text3 \
    google-chrome \
    dropbox \
    spotify \
    viscosity \
    dockertoolbox \
    google-hangouts \
    0xdbe-eap \
    java6

# install libraries
brew install \
    tmux \
    httpie \
    htop \
    postgresql \
    redis \
    geoip \
    geoipupdate \
    s3cmd \
    hg \
    npm

pip install --user \
    cdiff \
    virtualenv \
    debug

# link config files
ln -s ${PWD}/etc/.tmux.conf ~/.tmux.conf
ln -s ${PWD}/etc/.gitconfig ~/.gitconfig

# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
