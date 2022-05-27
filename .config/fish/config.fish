#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Configuration file for Fish shell

### PLUGINS ###
# oh-my-posh
oh-my-posh init fish --config ~/.config/oh-my-posh/lsz.omp.json | source

### ALIASES ###
# ProtonVPN
alias proton="protonvpn-cli"
alias protond="protonvpn-cli disconnect"
alias protonr="protonvpn-cli connect -r"
alias protonf="protonvpn-cli connect -f"
alias protonksoff="protonvpn-cli ks --off"
alias protonks="protonvpn-cli ks --permanent"
alias protonns="protonvpn-cli ns --ads-malware"
alias protonnsoff="protonvpn-cli ns --off"

# Custom
alias ls="exa --icons"
alias la="exa -a --icons"
alias ll="exa -l --icons --header"
alias ..='cd ..'

# Flags
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias grep='grep --color=auto'

# Vim
alias vim="nvim"

# Configuration manager repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### STARTUP ###
# Disable greeting
set fish_greeting

# Show neofetch output
neofetch