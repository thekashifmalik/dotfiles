#!/bin/bash
set -eo pipefail

# install cask for binaries
brew tap caskroom/versions
brew tap homebrew/boneyard
brew tap homebrew/versions

# install binaries
brew cask install \
    google-chrome \
    iterm2 \
    sublime-text \
    dropbox \
    spotify \
    viscosity \
    google-hangouts \
    datagrip \
    java6 \
    slack \
    shiftit \
    1password \
    steam

# install libraries
brew install \
    python \
    tmux \
    httpie \
    htop \
    libmemcached \
    memcached \
    redis \
    postgresql \
    geoip \
    geoipupdate \
    s3cmd \
    hg \
    node4-lts \
    cdiff

# install python packages
pip install \
    virtualenv \
    debug

# link config files
ln -sf ${PWD}/etc/.bash_profile ~/.bash_profile
ln -sf ${PWD}/etc/.bashrc ~/.bashrc
ln -sf ${PWD}/etc/.tmux.conf ~/.tmux.conf
ln -sf ${PWD}/etc/.gitconfig ~/.gitconfig
ln -sf ${PWD}/etc/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
