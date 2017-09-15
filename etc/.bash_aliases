echo 'reading .bash_aliases'

# Python virtualenv management helpers.
alias reset-venv-2='rm -rf venv && virtualenv venv && source venv/bin/activate'
alias reset-venv-3='rm -rf venv && python3 -m venv venv && source venv/bin/activate'


# Make using docker-compose a little less tedious.
alias dc='docker-compose'

alias cdiff='cdiff --side-by-side --width=0'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ls aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# human readable output sizes
alias du='du -h'
