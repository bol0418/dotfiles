# dotfiles

On Windows, you can perform command operations similar to `bash` and `zsh` using `powershell`.

## ToC

- [Windows (PowerShell)](#windows-powershell)
- [Unix-like OS](#unix-like-os)
- [Software](#software)

## Windows (PowerShell)

### 1. Updating PowerShell using Winget

To update PowerShell to the latest version, use `winget`. [Official Manual.](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#install-powershell-using-winget-recommended)

### 2. `install.ps1`

Run `install.ps1` before executing `install_with_admin.ps1`.

1. Set up the XDG Base Directory Specification in PowerShell.
2. Create the various XDG directories.
3. Install Scoop.
4. Use Scoop to install several software packages.

### 3. `install_with_admin.ps1`

Place the configuration files under dotfiles to the necessary locations using symbolic links.

When creating a symbolic link, administrator privileges are required.

## Unix-like OS

### 1. install.sh

Run `install.sh`.

...

## Software

### Common

- neovim

### Windows Env

- [scoop](https://scoop.sh/) (package manager)
    - posh-git
    - gsudo
    - mingw
    - neovim

### Unix-like Env

...

