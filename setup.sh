#!/usr/bin/env zsh
set -e

[[ -v ZSH ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if ! command -v rustup &>/dev/null; then
    echo "rustup not found. Installing..."

    # Run the rustup installer script
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # Add the cargo binary directory to the PATH
    export PATH="$HOME/.cargo/bin:$PATH"

    # Source the shell profile to apply changes
    source "$HOME/.zshrc"
fi

# Install alacritty, starship
cargo install alacritty starship bat

SRC_DIR="$(pwd)"

# start linking

# Git
ln -sf "$SRC_DIR/git/.gitconfig" "$HOME/.gitconfig"

# Vim
mkdir -p "$HOME/.config/nvim"
ln -sf "$SRC_DIR/other/.vimrc" "$HOME/.config/nvim/init.vim"

# Zsh
ln -sf "$SRC_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$SRC_DIR/zsh/vringar.zsh-theme" "${ZSH_CUSTOM:-$ZSH/custom}/themes/vringar.zsh-theme"

#KDE
ln -sf "$SRC_DIR/KDE/path.sh" "$HOME/.config/plasma-workspace/env/path.sh"
ln -sf "$SRC_DIR/KDE/kglobalshortcutsrc" "$HOME/.config/kglobalshortcutsrc"
ln -sf "$SRC_DIR/KDE/khotkeysrc" "$HOME/.config/khotkeysrc"

#SSH
systemctl --user enable ssh-agent.service
systemctl --user start ssh-agent.service

echo "Setup ran to completion"