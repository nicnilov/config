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

export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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
alias mtx="iex -S mix test --trace"
alias exifstrip="exiftool -all="
alias ic=imgcat
alias ils=imgls

. ~/dotfiles/shell/z.sh
export ANDROID_HOME="/Users/alucard/projects/_tools/android-r25.2.3"
export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
# export PATH="/usr/local/sbin:$PATH"

export GTAGSLABEL=pygments

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function mntg() {
  montage -label '%d\\%f\n%wx%h' $@ -auto-orient -background '#666666' -mattecolor '#DFDFDF' -shadow -geometry 600x600\>+4+4 -tile 4x8 -border 8x8 -frame 5 montage_%d.jpg
}

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

function noindex() {
  mdutil -i off .
  sudo rm -rf .{,_.}{fseventsd,Spotlight-V*,Trashes,DocumentRevisions-V*}
  mkdir .fseventsd
  touch .fseventsd/no_log .metadata_never_index .Trashes
  echo "Done"
}

# Retry command https://gist.github.com/nicnilov/e507791d91fbc8e37b129dfdc168494b
function retry() {
    SLEEP_TIME="30"
    MAX_RETRIES="10"

    # Command-line arguments parsing
    while [[ $# > 1 ]]
    do
    key="$1"

    case $key in
        -s|--sleep)
        SLEEP_TIME="$2"
        shift # past argument
        ;;
        -m|--max)
        MAX_RETRIES="$2"
        shift # past argument
        ;;
        *)
        break # unknown option
        ;;
    esac
    shift # past argument or value
    done

    # The command is all remaining arguments
    COMMAND="$@"

    echo $COMMAND

    i=0

    # I'm using eval to allow for pipes. This could become an option
    eval $COMMAND

    while [ $? -ne 0 -a $i -lt $MAX_RETRIES ]
    do
        echo "Command failed - retrying in $SLEEP_TIME..."
        sleep $SLEEP_TIME
        i=$(($i+1))
        eval $COMMAND
    done

    if [ $i -eq $MAX_RETRIES ]
    then
        echo "Max retries reached"
    fi
}

export PATH="$HOME/.yarn/bin:$PATH"
export ERL_AFLAGS="-kernel shell_history enabled"
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

