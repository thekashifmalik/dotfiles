dotfiles
========

OSX
---

Install the prerequisites:

    # OSX command line developer tools
    xcode-select --install

    # homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Clone the repository and run the bootstrap script:

    git clone https://github.com/kalail/dotfiles.git
    cd dotfiles
    bin/bootstrap-osx.sh
