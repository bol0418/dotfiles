# !! Administrative privileges are required !!

# ===========================================================
# Set up dotfiles in the environment
# ===========================================================

# Get the directory of the current script (e.g. C:\Users\username\dotfiles)
$scriptDir = Split-Path $script:MyInvocation.MyCommand.Path

# Set the configuration file as an alias
## pwsh
New-Item `
    -ItemType SymbolicLink `
    -Path $PROFILE `
    -Target "$scriptDir\posh\Microsoft.PowerShell_profile.ps1" `
    -Force

## nvim
New-Item `
    -ItemType SymbolicLink `
    -Path "$env:XDG_CONFIG_HOME\nvim" `
    -Target "$scriptDir\nvim" `
    -Force

## markdownlint
New-Item `
    -ItemType SymbolicLink `
    -Path "$env:USERPROFILE\.config\.markdownlint.json" `
    -Target "$scriptDir\.markdownlint.json" `
    -Force

## wezterm
New-Item `
    -ItemType SymbolicLink `
    -Path "$env:USERPROFILE\.config\.wezterm.lua" `
    -Target "$scriptDir\.wezterm.lua" `
    -Force

Write-Host "Files have been symlinked successfully."
