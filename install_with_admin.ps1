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

## memo
New-Item `
    -ItemType SymbolicLink `
    -Path "$env:USERPROFILE\AppData\Roaming\memo\config.toml" `
    -Target "$scriptDir\memo\config.toml" `
    -Force

New-Item `
    -ItemType SymbolicLink `
    -Path "$env:XDG_CONFIG_HOME\memo" `
    -Target "$scriptDir\memo" `
    -Force

Write-Host "Files have been symlinked successfully."
