# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z $GOPATH ]] && export GOPATH="$HOME/projects/go"

export EDITOR='vim'
setopt nosharehistory

alias l='LC_COLLATE=C gls -lah -v --time-style="+%Y-%m-%d %H:%M:%S" --group-directories-first --color=auto' # depends on `brew install coreutils`
alias ll='LC_COLLATE=C gls -la -v --time-style="+%Y-%m-%d %H:%M:%S" --group-directories-first --color=auto' # depends on `brew install coreutils`
alias -g grp='| grep -i'
alias -s rb=vim
alias -s txt=vim
alias -s lg="less -MN"
alias rc='bundle exec rails c'
alias hrc='heroku run rails c'
alias rs='bundle exec rails s'
alias hg="history | grep"
alias hist='history'
alias ber='bundle exec rspec'
alias git=g
alias dm=docker-machine
alias iem="iex -S mix"
alias mtx="iex -S mix test --trace"
alias exifstrip="exiftool -all="
alias ic=imgcat
alias ils=imgls

# source ~/.profile

# eval `dircolors ~/dotfiles/shell/.dircolors`
