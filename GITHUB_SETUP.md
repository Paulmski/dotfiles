# Pushing Your Dotfiles to GitHub

## Step 1: Create a Repository on GitHub

1. Go to https://github.com/new
2. Enter the repository name: `dotfiles`
3. Add a description: "My personal dotfiles for Neovim, Tmux, and shell configs"
4. Choose **Private** (recommended for personal configs) or **Public**
5. Click "Create repository"

## Step 2: Add Remote and Push

Replace `<your-username>` with your GitHub username and run:

```bash
cd ~/dotfiles
git remote add origin https://github.com/<your-username>/dotfiles.git
git branch -M main
git push -u origin main
```

Or if using SSH:

```bash
cd ~/dotfiles
git remote add origin git@github.com:<your-username>/dotfiles.git
git branch -M main
git push -u origin main
```

## Step 3: Verify

Visit https://github.com/<your-username>/dotfiles to see your repository online!

## Future Updates

Whenever you update your configs:

```bash
cd ~/dotfiles
git add -A
git commit -m "Update: describe your changes here"
git push
```

## Notes

- Update the README.md with your GitHub username in the clone URL
- Consider keeping this private if it contains sensitive information
- The submodules will be properly managed with `git clone --recursive`
