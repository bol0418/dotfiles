#!/bin/bash

# Dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks (force create, symbolic and interactive)
ln -fsi $DOTFILES_DIR/.vimrc ~
ln -fsi $DOTFILES_DIR/.tmux.conf ~
ln -fsi $DOTFILES_DIR/.zshrc ~
