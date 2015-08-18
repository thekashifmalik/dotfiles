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

# install libraries
brew install tmux

# link config files
ln -s .tmux.conf ~/.tmux.conf
ln -s .bash_profile ~/.bash_profile

# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
