# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR='vim'
setopt nosharehistory
source ~/dotfiles/tmuxinator/tmuxinator.zsh

alias ls='ls --color=auto'
alias ll='ls -la -v'
alias -g gp='| grep -i'
alias -s rb=vim
alias -s txt=vim
alias -s lg="less -MN"
alias rc='bundle exec rails c'
alias hrc='heroku run rails c'
alias rs='bundle exec rails s'
alias hist='history'
alias ber='bundle exec rspec'

source ~/.profile

eval `dircolors ~/dotfiles/shell/.dircolors`
