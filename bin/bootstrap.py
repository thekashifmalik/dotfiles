#!/usr/bin/env python

# Make sure we're in the home directory.
cd ~

# Update the system package definitions.
apt-get update

# Install core tools.
apt-get install -y \
    aptitude \
    build-essential \
    hg \
    htop \
    tmux \
    python \
    python-pip \
    httpie \

# Install python dev packages.
apt-get install -y
pip install cdiff virtualenv debug

# geoip \
# geoipupdate \




brew install postgresql
brew install redis
brew install s3cmd
brew install npm


# link config files
ln -s etc/.tmux.conf ~/.tmux.conf
ln -s etc/.bash_profile ~/.bash_profile
ln -s etc/.gitconfig ~/.gitconfig

# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
