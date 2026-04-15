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

# Copy Tmux configs
echo "Copying Tmux configs..."
cp -r ~/.tmux/* tmux/ 2>/dev/null || echo "  ⚠ Could not copy tmux plugins"
cp ~/.tmux.conf tmux/.tmux.conf 2>/dev/null || echo "  ⚠ Could not copy .tmux.conf"

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
