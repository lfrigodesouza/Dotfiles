#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Configuration file for ZSH shell

### IMPORTS ###
# zsh plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

### PLUGINS ###
# oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/lsz.omp.json)"

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

# Flags
alias la="ls -A"
alias ll="ls -alF"
alias rf="rm -rfi"
alias cp="cp -i"
alias cf="cp -ri"
alias mv="mv -i"
alias rm="rm -i"

# Vim
alias vim="nvim"

# Configuration manager repository
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

### STARTUP ###
# ssh-agent
eval `ssh-agent -s` > /dev/null

# Start ProtonVPN on a random server if it's not connected
if proton status | grep "No active"; then
	protonvpn-cli connect -r > /dev/null
	echo "ProtonVPN Connected"
fi

# Show neofetch output
neofetch
