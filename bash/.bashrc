# If not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

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

# Alias definitions.
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

if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# # Colors
# COLOR_NEUTRAL="\[\e[48;5;237m\]"
# COLOR_RESET="\[\e[0m\]"
# COLOR_1="\[\e[48;5;196m\]"
# COLOR_2="\[\e[48;5;202m\]"
# COLOR_3="\[\e[48;5;197m\]"
# COLOR_4="\[\e[48;5;199m\]"
# COLOR_5_1="\[\e[48;5;235m\]"
# COLOR_5_2="\[\e[48;5;239m\]"
# COLOR_6="\[\e[48;5;245m\]"

# # Fancy prompt.
# prompt_cmd () {
#     PSL="${COLOR_1}  BASH  ${COLOR_RESET}"
#     PSL+="${COLOR_2} @\u ${COLOR_RESET}"
#     PSL+="${COLOR_3} #\h ${COLOR_RESET}"
#     PSL+="${COLOR_4} \w ${COLOR_RESET}"

#     local branch
#     if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
#         local status=$(git status --porcelain 2> /dev/null)
#         if [[ "$status" != "" ]]; then
#             git_dirty='*'
#         else
#             git_dirty=''
#         fi
#         PSL+="${COLOR_5_1} GIT ${COLOR_RESET}"
#         PSL+="${COLOR_5_2} $(git branch | grep "*" | cut -d" " -f2)$git_dirty ${COLOR_RESET}"
#     fi

#     if [[ -f "Dockerfile" ]]; then
#         PSL+="${COLOR_5_1} DOCKER ${COLOR_RESET}"
#         PSL+="${COLOR_5_2} Dockerfile ${COLOR_RESET}"
#     fi

#     if ! [[ -z "$VIRTUAL_ENV" ]]; then
#         PSL+="${COLOR_5_1} VENV ${COLOR_RESET}"
#         PSL+="${COLOR_5_2} $VIRTUAL_ENV ${COLOR_RESET}"
#     fi

#     if [[ -d "venv" ]] && [[ -z "$VIRTUAL_ENV" ]]; then
#         PSL+="${COLOR_6} [VENV] ${COLOR_RESET}"
#     fi

#     if [[ -f "Gemfile" ]]; then
#         PSL+="${COLOR_6} [GEMFILE] ${COLOR_RESET}"
#     fi

#     if [[ -f "Pipfile" ]]; then
#         PSL+="${COLOR_6} [PIPFILE] ${COLOR_RESET}"
#     fi

#     if [[ -f "package.json" ]]; then
#         PSL+="${COLOR_6} [PACKAGE.JSON] ${COLOR_RESET}"
#     fi


#     PS1="${PSL}\n▶ "
#     # PS1="${PSL}\n> "
#     # PS1="${PSL}\n$ "
# }
# export PROMPT_COMMAND='prompt_cmd'

# # After each command, append to the history file and reread it
# export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"


export TERM=xterm-256color
export EDITOR=nvim

export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# FZF completions.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Bash completions.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH=/usr/local/bin:$PATH
export PATH=~/.local/bin:$PATH  # Not sure why pip is putting things in here.
export PATH="/usr/local/opt/node@6/bin:$PATH"

# pipenv
export PIPENV_VENV_IN_PROJECT="1"
eval "$(pipenv --completion)"

# Homebrew fix for gmp compile errors.
export "CFLAGS=-I/usr/local/include -L/usr/local/lib"

# jEnv stuff.
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# pyenv setup.
eval "$(pyenv init -)"
HOMEBREW_NO_AUTO_UPDATE=1
