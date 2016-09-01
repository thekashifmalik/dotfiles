dotfiles
========

OSX
---

Install command line developer tools and homebrew:

    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


Clone the repository and run the bootstrap script:

    git clone https://github.com/kalail/dotfiles.git
    cd dotfiles
    bin/bootstrap-osx.sh
