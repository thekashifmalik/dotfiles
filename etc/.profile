# ~/.profile: executed by Bourne-compatible login shells.

echo 'reading .profile'

# Load standard bash config
if [ "$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        echo 'reading .bashrc'
        . ~/.bashrc
    fi
fi

# Override .bashrc
HISTCONTROL=ignoredups:ignorespace
force_color_prompt=yes

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

