#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Configuration file for PowerShell

### IMPORTS ###
Import-Module -Name Terminal-Icons
Import-Module PSReadLine

### PLUGINS ###
# PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# oh-my-posh
oh-my-posh init pwsh --config ~/.poshthemes/lsz.omp.json | Invoke-Expression

### CUSTOM FUNCTIONS ###
# Docker
function docker(){
	# This function makes it possible to interact with the Docker CLI installed on WSL
	# directly from PowerShell without the need to append 'wls' to every command
	wsl docker $args
}
function docker-start(){
	# Checks whether docker is running or not, and starts it
	wsl sudo service docker status || wsl sudo service docker start
}

### STARTUP ###
# neofetch
neofetch

