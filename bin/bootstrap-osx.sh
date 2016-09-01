#!/bin/sh

# install cask for binaries
brew tap caskroom/versions
brew tap homebrew/boneyard

# install binaries
brew cask install \
    firefoxdeveloperedition \
    iterm2 \
    sublime-text \
    google-chrome \
    dropbox \
    spotify \
    viscosity \
    google-hangouts \
    datagrip \
    java6

# install libraries
brew install \
    python \
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

pip install \
    cdiff \
    virtualenv \
    debug

# link config files
ln -sf ${PWD}/etc/.bash_profile ~/.bash_profile
ln -sf ${PWD}/etc/.tmux.conf ~/.tmux.conf
ln -sf ${PWD}/etc/.gitconfig ~/.gitconfig

# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
