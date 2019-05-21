# Python virtualenv management helpers.
alias reset-venv-2='rm -rf venv && virtualenv --python python2 venv && source venv/bin/activate'
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

# Make aliases work with sudo.
alias sudo='sudo '

# Human readable output sizes.
alias du='du -h'
alias df='df -h'

# Colorize less output.
alias less='less -r'

# Colorize jq output.
alias jq='jq -C'

# Colorize httpie output.
alias http='http --pretty all'

# Output cdiff compatible output
alias diff='diff -u'

# Colorize tree output.
alias tree='tree -C'

alias cat='bat --plain'
alias ccat='bat --plain'

alias ls='exa --all --long --git'
alias cls='ls --color always'

alias crg='rg --color always'

# Change current dir when exiting ranger.
alias ranger='. ranger'
