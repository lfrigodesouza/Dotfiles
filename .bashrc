#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Configuration file for Bash shell

### ALIASES ###
# Configuration manager repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### STARTUP ###
# Do not load configs if not on interactive shell
[[ $- != *i* ]] && return

# Checks if fish is installed, and if it is, execute it
if command -v fish &> /dev/null; then
    # Do not execute it if it's being called from fish itself, to allow execution of bash
    # without removing the .bashrc file
    if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
    then
        exec fish
    fi
fi
