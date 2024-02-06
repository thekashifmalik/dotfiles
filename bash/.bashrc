# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

echo "> Reading BASH config: $HOME/.bashrc"

# Read files in ~/.bashrc.d
for FILE in ~/.bashrc.d/*;
do
    if [ ! -d "$FILE" ]; then
        . $FILE
    fi
done

if [[ "$OSTYPE" =~ ^linux ]]; then
    for FILE in ~/.bashrc.d/linux/*;
    do
    . $FILE
    done
fi

if [[ "$OSTYPE" =~ ^darwin ]]; then
    # Set up brew shell environment
    ARCH=$(uname -m)
    if [[ $ARCH == 'arm64' ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
    if [[ $ARCH == 'x86_64' ]]; then
        eval "$(/usr/local/bin/brew shellenv)"
    fi

    for FILE in ~/.bashrc.d/darwin/*;
    do
        if [ ! -d "$FILE" ]; then
            . $FILE
        fi
    done
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

export TERM=xterm-256color
export EDITOR=nvim

[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"
export PATH=$PATH:$HOME/.cargo/bin

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH  # Not sure why pip is putting things in here.
export PATH="/usr/local/opt/node@6/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc'; fi


if [[ "$OSTYPE" =~ ^darwin ]]; then
    # We want to use GNU core utils when possible
    PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi


# SLOW
# TODO: Figure out how to enable these without slowing down startup time.

# # Bash completions.
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# # pipenv
# export PIPENV_VENV_IN_PROJECT="1"
# eval "$(pipenv --completion)"

# # pyenv setup.
# eval "$(pyenv init -)"

# # jEnv stuff.
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

export PATH="$HOME/dotfiles/disqus/bin:$PATH"

[ -e ~/.coinbase ] && . ~/dotfiles/coinbase/.bashrc
