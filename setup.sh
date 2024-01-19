#!/usr/bin/env zsh
set -e

[[ -v ZSH ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO download rustup
# Install alacritty, starship
cargo install alacritty starship bat

SRC_DIR="$(pwd)"
TARGET_DIR="/home/$(whoami)"

# start linking

# Git
ln -sf "$SRC_DIR/git/.gitconfig" "$TARGET_DIR/.gitconfig"

# Other
ln -sf "$SRC_DIR/other/.virmrc" "$TARGET_DIR/.virmrc"

# Zsh
ln -sf "$SRC_DIR/zsh/.zshrc" "$TARGET_DIR/.zshrc"
ln -sf "$SRC_DIR/zsh/vringar.zsh-theme" "$TARGET_DIR/.oh-my-zsh/themes/vringar.zsh-theme"
