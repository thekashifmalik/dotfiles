echo 'reading .bashrc'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
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

# Colors
txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"  # Text Reset

# Fancy prompt.
prompt_cmd () {
    # Prompt format.
    # TIME://USERNAME@HOSTNAME/PATH?KEY=VALUE

    # We start witha newline
    PS1="\n"
    PS1+="\[${txtcyn}\]\D{%Y-%m-%dT%H-%M-%S}"
    PS1+="\[${txtrst}\]://"
    PS1+="\[${txtgrn}\]\u"
    PS1+="\[${txtrst}\]@"
    PS1+="\[${txtylw}\]\h"
    PS1+="\[${txtrst}\]/"
    PS1+="\[${txtred}\]\w"

    PS1+="\[${txtrst}\]?"
    PS1+="\[${txtblu}\]pid"
    PS1+="\[${txtrst}\]="
    PS1+="\[${txtpur}\]$$"

    if [ "$(type -t deactivate)" = 'function' ]; then
        deactivate
    fi

    if [ -d "venv" ]; then
        VIRTUAL_ENV_DISABLE_PROMPT=1
        source venv/bin/activate
    fi

    if ! [[ -z "$VIRTUAL_ENV" ]]; then
        PS1+="\[${txtrst}\]&"
        PS1+="\[${txtblu}\]venv"
        PS1+="\[${txtrst}\]="
        PS1+="\[${txtpur}\]$VIRTUAL_ENV"
    fi

    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        local status=$(git status --porcelain 2> /dev/null)
        if [[ "$status" != "" ]]; then
            git_dirty='*'
        else
            git_dirty=''
        fi
        PS1+="\[${txtrst}\]&"
        PS1+="\[${txtblu}\]git"
        PS1+="\[${txtrst}\]="
        PS1+="\[${txtpur}\]$branch$git_dirty"
    fi

    # Prompt.
    PS1+="\[${txtrst}\]\n"
    PS1+="\[${txtcyn}\]\$\[${txtrst}\] "
}
export PROMPT_COMMAND='prompt_cmd'

export TERM=xterm-256color
export EDITOR=nvim

# Add rust toolchain to path
export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# FZF completions.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Bash completions.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
