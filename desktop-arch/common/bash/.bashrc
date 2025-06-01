#
# ~/.bashrc
#

# If not running interactively, exit
[[ $- != *i* ]] && return

# Colored prompt
PS1='\[\033[1;36m\]\u\[\033[0;34m\]@\[\033[1;36m\]\h:\[\033[1;35m\]\w\[\033[0;34m\]\$\[\033[0m\] '
