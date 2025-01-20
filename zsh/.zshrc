#!/usr/bin/env zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.config/plasma-workspace/env/path.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi

LOCAL_CONFIG="$HOME/.zshrc.local"
if [[ -e $LOCAL_CONFIG ]]; then
  source $LOCAL_CONFIG
fi
DOTFILES_REPO=$(dirname $(dirname $(readlink "$HOME/.zshrc")))
UPDATE_CHECK_DONE_PATH=/tmp/dotfiles_updated_checked
if [[ ! -e $UPDATE_CHECK_DONE_PATH && -n $DOTFILES_REPO ]]; then
  cd $DOTFILES_REPO
  ./check-update.zsh
  touch $UPDATE_CHECK_DONE_PATH
  cd -
fi
unset UPDATE_CHECK_DONE_PATH

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="vringar"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  tmux git python rust nix-shell nix-zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LANGUAGE=en_GB.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
alias vim='nvim'
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export LC_TIME="en_GB.UTF-8"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias tmux='tmux -u'
if command -v code-insiders &> /dev/null; then
  alias code='code-insiders'
fi
alias tf='terraform'
alias dck='docker compose'
if command -v firefox-nightly &> /dev/null; then
  export BROWSER="firefox-nightly"
fi
eval "$(starship init zsh)"

export RUST_BACKTRACE=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion


if command -v direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
fi
if ! [[ -z "${CONDA_INSTALL_LOCATION}" ]]; then
  if [[ -e $CONDA_INSTALL_LOCATION ]]; then
    echo "Conda install location doesn't exist"
  else
    eval "$($CONDA_INSTALL_LOCATION/bin/conda shell.zsh hook)"
    if command -v conda &>/dev/null; then
        conda config --set auto_activate_base false
    fi
  fi
fi
