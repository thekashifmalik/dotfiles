#!/bin/sh

# install developer tools
xcode-select --install

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# install binaries
brew cask install firefoxdeveloperedition
brew cask install iterm2
brew cask install sublime-text3
brew cask install google-chrome
brew cask install dropbox
brew cask install spotify
brew cask install viscosity
brew cask install dockertoolbox

# install libraries
brew install tmux
brew install httpie
brew install htop
brew install postgresql
brew install redis
brew install geoip geoipupdate
sudo easy_install pip
sudo pip install cdiff
sudo pip install virtualenv
sudo pip install debug

# link config files
ln -s etc/.tmux.conf ~/.tmux.conf
ln -s etc/.bash_profile ~/.bash_profile
ln -s etc/.gitconfig ~/.gitconfig

# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
