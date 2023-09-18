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
$envVars = "XDG_CONFIG_HOME", "XDG_DATA_HOME", "XDG_CACHE_HOME", "XDG_STATE_HOME"
foreach ($var in $envVars) {
    $xdg_dir = Get-Content "env:$var"
    if (!(Test-Path $xdg_dir)) {
        New-Item -ItemType Directory -Force -Path $xdg_dir
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
    "posh-git" `
    , "gsudo", `
    , "nvm" `
    , "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json" `
    , "mingw" `
    , "neovim"

foreach ($val in $vals) {
    scoop install $val
}

# install nodejs
nvm install stable --latest-npm

# ===========================================================
# Info
# ===========================================================
Write-Host "[Next Action] To set the alias in the configuration file, run `install_with_admin.ps1` with administrator privileges."
