#!/bin/bash

# ORIGINAL_DIR=$(pwd)
# REPO_URL="https://github.com/typecraft-dev/dotfiles"
REPO_NAME="dotfiles"


is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Installing stow first"
  sudo pacman -S stow --no-confirm
fi

# # Check if the repository already exists
# if [ -d "$REPO_NAME" ]; then
#   echo "Repository '$REPO_NAME' already exists. Skipping clone"
# else
#   git clone "$REPO_URL"
# fi
# Check if the clone was successful
# if [ $? -eq 0 ]; then
#   cd "$REPO_NAME"
#   stow zshrc
#   stow nvim
#   stow starship
# else
#   echo "Failed to clone the repository."
#   exit 1
# fi

# If file exists, you can adopt the file and then restore the git repo files
# stow --adopt zshrc
# git restore .

# Backing up and renaming files if they exist so stow will work
if [ -f ~/.zshrc ]; then
  echo "'~/.zshrc' already exists, creating '~/.zshrc.bak'"
  mv ~/.zshrc ~/.zshrc.bak
fi

if [ -d ~/.config/nvim ]; then
  echo "'~/.config/nvim' already existing, creating '~/.config/nvim.bak'"
  mv ~/.config/nvim/ ~/.config/nvim.bak/
fi

if [ -f ~/.config/starship.toml]; then
  echo "'~/.config/starship.toml' already exists, creating '~/.config/starship.toml.bak'"
  mv ~/.config/starship.toml ~/.config/starship.toml.bak
fi

cd ~/"$REPO_NAME"
stow zshrc
stow nvim
stow starship

echo "Dotfiles have been installed!!\n\nYou may want to reload your shell apply changes."

