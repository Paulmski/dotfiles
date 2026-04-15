# Dotfiles

A backup of my personal configuration files for Neovim, Tmux, and shell environments.

## Contents

- **nvim/** - Neovim configuration files
- **tmux/** - Tmux configuration and plugins
- **shell/** - Bash and Zsh configuration files

## Installation

### Quick Setup

Clone this repository and run the installation script:

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Manual Installation

Alternatively, you can manually symlink the configuration files:

```bash
# Neovim
ln -s ~/dotfiles/nvim ~/.config/nvim

# Tmux
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/tmux ~/.tmux

# Shell (choose one or both)
ln -s ~/dotfiles/shell/.bashrc ~/.bashrc
ln -s ~/dotfiles/shell/.zshrc ~/.zshrc
```

## Prerequisites

- Git
- Neovim (optional, for nvim configs)
- Tmux (optional, for tmux configs)
- Bash or Zsh (depending on your preference)

## Notes

- These configurations are personalized for my setup. Feel free to adapt them for your own use.
- Make sure to back up your existing configurations before symlinking.

## License

MIT - Feel free to use these dotfiles as a reference for your own setup.
