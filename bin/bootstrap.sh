#!/bin/sh

# Update the system package definitions.
apt-get update

# Install core tools.
apt-get install -y \
    aptitude \
    build-essential \
    mercurial \
    htop \
    tmux \
    python \
    python-pip \
    httpie \

# Copy config files.
rm -f ~/.profile && cp etc/.profile ~/.profile
rm -f ~/.tmux.conf && cp etc/.tmux.conf ~/.tmux.conf
rm -f ~/.gitconfig && cp etc/.gitconfig ~/.gitconfig
