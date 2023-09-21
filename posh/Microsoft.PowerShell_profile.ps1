# --------------------
# General Configurations
# --------------------

## Set Encoding for Console: Ensure the console's default encoding is set to UTF-8.
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

## Display Multibyte Characters in git log: This includes emojis.
$env:LESSCHARSET = "utf-8"

## Set Input Autocompletion Based on History
Set-PSReadLineOption -PredictionSource History

# --------------------
# Initialize oh-my-posh
# --------------------
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/robbyrussell.omp.json | Invoke-Expression

# --------------------
# Import git complements
# --------------------
Import-Module posh-git

# --------------------
# Custom Functions
# --------------------

## Introduce 'which' Command
function which { (Get-Command $args).Definition }

## Set Tab Completion Similar to zsh
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete

## Alias
Set-Alias vim nvim
