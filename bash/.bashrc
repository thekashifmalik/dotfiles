# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Fancy bash prompt.
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# Start SSH agent on first login.
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH  # Not sure why pip is putting things in here.
export PATH="/usr/local/opt/node@6/bin:$PATH"

# Homebrew fix for gmp compile errors.
export "CFLAGS=-I/usr/local/include -L/usr/local/lib"

export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# SLOW
# TODO: Figure out how to enable these without slowing down startup time.

# # FZF completions.
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# # Bash completions.
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# # pipenv
# export PIPENV_VENV_IN_PROJECT="1"
# eval "$(pipenv --completion)"

# # pyenv setup.
# eval "$(pyenv init -)"
# HOMEBREW_NO_AUTO_UPDATE=1

# # jEnv stuff.
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"
