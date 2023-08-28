# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/.cargo/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=/home/stefan/.oh-my-zsh

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
  git tmux python rust nix-shell nix-zsh-completions
)

prompt_nix_shell_setup

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
alias code='code-insiders'
alias tf='terraform'
alias dck='docker compose'
export BROWSER="firefox-nightly"

eval "$(starship init zsh)"

export RUST_BACKTRACE=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/run/media/stefan/SourceCode/mambaforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/run/media/stefan/SourceCode/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/run/media/stefan/SourceCode/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/run/media/stefan/SourceCode/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/run/media/stefan/SourceCode/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/run/media/stefan/SourceCode/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

