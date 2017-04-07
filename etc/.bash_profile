# I like my terminal editors useless
export EDITOR=nano

# Set up android dev tools
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Load standard bash config
source ~/.bashrc

# Create alias for python virtualenv
alias reset-venv-2='rm -rf venv && virtualenv venv && source venv/bin/activate'
alias reset-venv-3='rm -rf venv && python3 -m venv venv && source venv/bin/activate'

# Make using docker-compose a little less tedious
alias dc='docker-compose'

# Load bash completions
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/kashif/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/kashif/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/kashif/Downloads/google-cloud-sdk/completion.bash.inc'
fi

# Git status in prompt
export GITAWAREPROMPT=~/dotfiles/vendor/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Fancy prompt with git status.
export PS1="\[${bldgrn}\]\u@\h\[${txtrst}\] \[${bldblu}\]\w\[${txtrst}\] \[${bldylw}\]\${git_branch}\[${txtrst}\] \[${txtred}\]\${git_dirty}\[${txtrst}\]\n\[${txtpur}\]\$\[${txtrst}\] "


export TERM=xterm-256color
export EDITOR=nvim
if [ -e /Users/kashif/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/kashif/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


# Add rust toolchain to path
export PATH="$HOME/.cargo/bin:$PATH"
