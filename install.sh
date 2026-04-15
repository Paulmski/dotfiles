#!/bin/bash

# Dotfiles Installation Script
# This script will symlink your dotfiles to their proper locations

set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Create backup directory
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%s)"
mkdir -p "$BACKUP_DIR"
echo "Backup directory created at $BACKUP_DIR"

# Function to safely symlink
symlink_file() {
    local source=$1
    local target=$2
    
    if [ -e "$target" ]; then
        echo "  Backing up $target..."
        mv "$target" "$BACKUP_DIR/"
    fi
    
    ln -s "$source" "$target"
    echo "  ✓ Symlinked $target"
}

# Function to copy files (for spell files that shouldn't be symlinked)
copy_files() {
    local source=$1
    local target=$2
    
    if [ -d "$source" ]; then
        mkdir -p "$target"
        cp -r "$source"/* "$target/" 2>/dev/null || true
        echo "  ✓ Copied files to $target"
    fi
}

# Install Neovim config
if [ -d "$DOTFILES_DIR/nvim" ]; then
    echo ""
    echo "Installing Neovim config..."
    symlink_file "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
fi

# Install Neovim spell files (copy, don't symlink)
if [ -d "$DOTFILES_DIR/nvim/spell" ]; then
    echo ""
    echo "Installing Neovim spell files..."
    mkdir -p "$HOME/.local/share/nvim/site/spell"
    copy_files "$DOTFILES_DIR/nvim/spell" "$HOME/.local/share/nvim/site/spell"
fi

# Install Tmux config
if [ -f "$DOTFILES_DIR/tmux/.tmux.conf" ]; then
    echo ""
    echo "Installing Tmux config..."
    symlink_file "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
fi

# Install Tmux plugins directory
if [ -d "$DOTFILES_DIR/tmux" ]; then
    echo ""
    echo "Installing Tmux plugins..."
    symlink_file "$DOTFILES_DIR/tmux" "$HOME/.tmux"
fi

# Install Shell configs
if [ -f "$DOTFILES_DIR/shell/.bashrc" ]; then
    echo ""
    echo "Installing Bash config..."
    symlink_file "$DOTFILES_DIR/shell/.bashrc" "$HOME/.bashrc"
fi

if [ -f "$DOTFILES_DIR/shell/.zshrc" ]; then
    echo ""
    echo "Installing Zsh config..."
    symlink_file "$DOTFILES_DIR/shell/.zshrc" "$HOME/.zshrc"
fi

echo ""
echo "✓ Installation complete!"
echo "Old configs backed up at: $BACKUP_DIR"
echo "You may need to restart your terminal or source your shell config."
