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
    mkdir -p ~/.ssh
    ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoredups:erasedups
SHELL_SESSION_HISTORY=0

# append to the history file, don't overwrite it
shopt -s histappend

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

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

[ -f ~/.cargo/env ] && . "$HOME/.cargo/env"
export PATH=$PATH:$HOME/.cargo/bin

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx


export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH  # Not sure why pip is putting things in here.
export PATH="/usr/local/opt/node@6/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# FZF completions.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'


# Git completions.
if [[ "$OSTYPE" =~ ^darwin ]]; then
    . "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
fi

# SSH completion. Copied from: https://dev.to/ahmedmusallam/how-to-autocomplete-ssh-hosts-1hob
_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(grep '^Host' ~/.ssh/config ~/.ssh/config.d/* 2>/dev/null | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh

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

export BASH_SILENCE_DEPRECATION_WARNING=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/dotfiles/disqus/bin:$PATH"

# Disable brew auto-update
export HOMEBREW_NO_AUTO_UPDATE=1

[ -e ~/dotfiles/coinbase/.bashrc ] && . ~/dotfiles/coinbase/.bashrc
