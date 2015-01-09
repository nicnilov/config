# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr
#
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR='vim'
source ~/.bin/tmuxinator.zsh

alias ls='ls --color=auto'
alias -g gp='| grep -i'
alias -s rb=vim
alias -s txt=vim
alias -s log="less -MN"

source ~/.profile

 eval `dircolors ~/config/terminal/.dircolors`
