# Set encoding to UTF-8
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# ===========================================================
# Set environment variable persistently for User
# ===========================================================

# When configured, it allows you to use what's under ~/.config.
# !! XDG_STATE_HOME needs to be the same as HOME !!

[Environment]::SetEnvironmentVariable(
    "XDG_CONFIG_HOME", "$env:USERPROFILE\.config", "User"
)
Write-Host "Set XDG_CONFIG_HOME as $env:XDG_CONFIG_HOME"

[Environment]::SetEnvironmentVariable(
    "HOME", "$env:USERPROFILE\.config", "User"
)
Write-Host "Set HOME as $env:HOME"

[Environment]::SetEnvironmentVariable(
    "XDG_DATA_HOME", "$env:USERPROFILE\.local\share", "User"
)
Write-Host "Set XDG_DATA_HOME as $env:XDG_DATA_HOME"

[Environment]::SetEnvironmentVariable(
    "XDG_CACHE_HOME", "$env:USERPROFILE\.local\cache", "User"
)
Write-Host "Set XDG_CACHE_HOME as $env:XDG_CACHE_HOME"

[Environment]::SetEnvironmentVariable(
    "XDG_STATE_HOME", "$env:USERPROFILE\.local\state", "User"
)
Write-Host "Set XDG_STATE_HOME as $env:XDG_STATE_HOME"

# Create the '~/.config' directory if it does not exist
$envVars = "$env:XDG_CONFIG_HOME", "$env:XDG_DATA_HOME", "$env:XDG_CACHE_HOME", "$env:XDG_STATE_HOME"
foreach ($var in $envVars) {
    if (!(Test-Path $var)) {
        New-Item -ItemType Directory -Force -Path $var
    }
}

# ===========================================================
# Install 
# ===========================================================

# Install scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

if (!(Get-Command scoop)) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

# install version controll
scoop bucket add versions

# Install external software using scoop
# posh-git, gsudo, oh-my-posh
$vals = `
    "git" `
    , "posh-git" `
    , "gsudo", `
    , "nvm" `
    , "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json" `
    , "mingw" `
    , "neovim"

foreach ($val in $vals) {
    scoop install $val
}

# install nodejs (LTS)
nvm install 18.18.0

# ===========================================================
# Info
# ===========================================================
Write-Host "[Next Action] To set the alias in the configuration file, run `install_with_admin.ps1` with administrator privileges."
