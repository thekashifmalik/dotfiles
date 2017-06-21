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
    PS1="\n"
    PS1+="\[${txtcyn}\]\D{%Y-%m-%dT%H-%M-%S}\[${txtrst}\]: " # Time
    PS1+="\[${txtrst}\]//\[${txtgrn}\]\u " # Username
    PS1+="\[${txtrst}\]@\[${txtylw}\]\h " # Hostname
    PS1+="\[${txtrst}\]/\[${txtblu}\]\w " # Path
    PS1+="\[${txtrst}\]? "

    # Virtualenv
    if ! [[ -z "$VIRTUAL_ENV" ]]; then
        PS1+="\[${txtred}\]venv\[${txtrst}\]=\[${txtpur}\]$VIRTUAL_ENV "
    fi

    # Git
    local branch
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        local status=$(git status --porcelain 2> /dev/null)
        if [[ "$status" != "" ]]; then
            git_dirty='*'
        else
            git_dirty=''
        fi
        PS1+="\[${txtred}\]git\[${txtrst}\]=\[${txtpur}\]$branch$git_dirty"
    fi

    # Prompt.
    PS1+="\[${txtrst}\]\n"
    PS1+="\[${txtcyn}\]\$\[${txtrst}\] "
}
export PROMPT_COMMAND='prompt_cmd'

export TERM=xterm-256color
export EDITOR=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add rust toolchain to path
export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

