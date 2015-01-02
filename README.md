#Local configuration files

##Git
.gitconfig needs to be moved to $HOME/.gitconfig after pulling as there is no proper way of specifying its custom location apart from using $XDG_CONFIG_HOME. The latter is a global setting (defaults to $HOME/.config) making lots of configs end up in that dir, many of which shouldn't be placed to a public repo.
##Tmuxinator
Same thing as with git. Need a script.
