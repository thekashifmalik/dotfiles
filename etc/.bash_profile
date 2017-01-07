# I like my terminal editors useless
export EDITOR=nano

# Set up android dev tools
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# Load standard bash config
source .bashrc

# Create alias for python virtualenv
alias reset-venv-2='rm -rf venv && virtualenv venv && source venv/bin/activate'
alias reset-venv-3='rm -rf venv && python3 -m venv venv && source venv/bin/activate'
