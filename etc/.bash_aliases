echo 'reading .bash_aliases'

# Python virtualenv management helpers.
alias reset-venv-2='rm -rf venv && virtualenv venv && source venv/bin/activate'
alias reset-venv-3='rm -rf venv && python3 -m venv venv && source venv/bin/activate'


# Make using docker-compose a little less tedious.
alias dc='docker-compose'

alias cdiff='cdiff --side-by-side --width=0'
