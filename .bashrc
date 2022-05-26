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
# Checks if zsh is installed, and if it is, execute it
if command -v zsh &> /dev/null; then
    exec zsh
fi
