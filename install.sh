#!/bin/bash

# Array of directory names to be linked
DIRS=("nvim" "zellij" "telekasten" ".markdownlint.json")

# Directory path for dotfiles
DOTFILES_DIR="$HOME/dotfiles"

# Iterate over each directory
for DIR in "${DIRS[@]}"
do
  # Path to the configuration files for the current directory
  CONFIG_DIR="$DOTFILES_DIR/$DIR"

  # Path to the symlink destination for the current directory
  LINK_DIR="$HOME/.config/$DIR"

  # Remove the existing symlink directory if it exists
  if [ -e "$LINK_DIR" ]; then
    echo "Removing existing $LINK_DIR"
    rm -rf "$LINK_DIR"
  fi

  # Create the symlink for the current directory
  echo "Creating symlink from $CONFIG_DIR to $LINK_DIR"
  ln -s "$CONFIG_DIR" "$LINK_DIR"
done

echo "Configuration files successfully linked!"
