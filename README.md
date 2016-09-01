dotfiles
========

OSX
---

Install OSX command line developer tools, homebrew and pip:

    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    sudo easy_install pip

Clone the repository and run the bootstrap script:

    git clone https://github.com/kalail/dotfiles.git
    cd dotfiles
    bin/bootstrap-osx.sh
