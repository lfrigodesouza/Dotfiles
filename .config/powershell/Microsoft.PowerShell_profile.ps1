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
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# oh-my-posh
oh-my-posh init pwsh --config ~/.poshthemes/lsz.omp.json | Invoke-Expression

### Completers ###
# winget
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
     param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# dotnet
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
     param($commandName, $wordToComplete, $cursorPosition)
         dotnet complete --position $cursorPosition "$wordToComplete" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
         }
 }
