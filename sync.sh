#!/bin/bash

# Dotfiles Sync Script
# Copies all updated configs from your home directory to the dotfiles repo
# and commits/pushes changes to GitHub

set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "📦 Syncing dotfiles from home directory to repo..."
echo ""

# Change to dotfiles directory
cd "$DOTFILES_DIR"

# Copy Neovim configs
echo "Copying Neovim configs..."
cp -r ~/.config/nvim/* nvim/ 2>/dev/null || echo "  ⚠ Could not copy nvim configs"

# Copy Neovim spell files (custom dictionary)
echo "Copying Neovim spell files..."
mkdir -p nvim/spell
cp ~/.local/share/nvim/site/spell/*.add nvim/spell/ 2>/dev/null || echo "  ⚠ No custom spell files found (this is optional)"

# Copy Tmux config (excluding plugins which are git submodules)
echo "Copying Tmux config..."
cp ~/.tmux.conf tmux/.tmux.conf 2>/dev/null || echo "  ⚠ Could not copy .tmux.conf"
# Note: tmux/plugins are managed as git submodules, so we don't copy them

# Copy Shell configs
echo "Copying Shell configs..."
cp ~/.bashrc shell/.bashrc 2>/dev/null || echo "  ⚠ Could not copy .bashrc"
cp ~/.zshrc shell/.zshrc 2>/dev/null || echo "  ⚠ Could not copy .zshrc"

echo ""
echo "📊 Checking for changes..."
echo ""

# Check if there are any changes
if [ -n "$(git status --porcelain)" ]; then
    echo "Changes detected:"
    git status --porcelain
    echo ""
    
    # Stage changes
    git add -A
    
    # Create commit message with timestamp
    COMMIT_MSG="Update: dotfiles sync $(date +%Y-%m-%d\ %H:%M:%S)"
    
    # Commit
    git commit -m "$COMMIT_MSG"
    echo ""
    echo "✅ Committed: $COMMIT_MSG"
    
    # Push to GitHub
    echo "Pushing to GitHub..."
    git push
    echo "✅ Pushed to GitHub"
    echo ""
    echo "✨ Sync complete!"
else
    echo "No changes detected. Everything is up to date!"
fi
