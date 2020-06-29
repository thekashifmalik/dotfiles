dotfiles
========
Setup scripts for a dev environment.

OSX
---

Install the prerequisites:

    # OSX command line developer tools
    xcode-select --install

    # homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Clone the repository and run the bootstrap script:

    git clone https://github.com/thekashifmalik/dotfiles.git
    cd dotfiles
    bin/dev.sh
