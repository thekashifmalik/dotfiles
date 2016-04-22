#!/bin/sh

# Install python dev packages.
pip install cdiff virtualenv debug

# Install commonly used packages.
apt-get install -y \
    postgresql \
    redis \
    npm \
    s3cmd


# create ssh keys
ssh-keygen -t rsa -b 4096 -C "kashif610@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
