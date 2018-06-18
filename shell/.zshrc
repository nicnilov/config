# Path to your oh-my-zsh installation.
export ZSH=/Users/alucard/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="cobalt2"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rails elixir react-native)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias ll='ls -la'
# alias ctags="`brew --prefix`/bin/ctags"
alias hg="history | grep"
alias iem="iex -S mix"

. ~/dotfiles/shell/z.sh
export ANDROID_HOME="/Users/alucard/projects/_tools/android-r25.2.3"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
# export PATH="/usr/local/sbin:$PATH"

export GTAGSLABEL=pygments

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function lb() {
  pname="${1:-Other}"
  fname=~"/projects/_writing/logbook/$pname:l-$(date '+%Y-%m-%d').logbook.md"
  if [[ ! -a $fname ]]; then
    tee -a $fname <<EOF > /dev/null
### Project
  $pname
### Task
  
### Approach
  
### Estimate
  
### Outcome
  
### Duration
  
EOF
  fi
  nvim $fname
  cd ~/projects/_writing/ && git add . && git cidate && cd -1
}

function td() {
  nvim ~/projects/_writing/todo/todo.md
  cd ~/projects/_writing/ && git add . && git cidate && cd -1
}

export PATH="$HOME/.yarn/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
