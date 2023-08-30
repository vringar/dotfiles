#!/usr/bin/env zsh

# TODO check if oh-my-zsh is installed
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO download rustup
# Install alacritty, starship
cargo install alacritty starship bat

# TODO make this dynamic
SRC_DIR="/home/stefan/projects/dotfiles"
TARGET_DIR="/home/stefan"

# start linking

# Git
ln -s $SRC_DIR/git/.gitconfig $TARGET_DIR/.gitconfig

# Other
ln -s $SRC_DIR/other/.virmrc $TARGET_DIR/.virmrc

# Zsh
ln -s $SRC_DIR/zsh/.zshrc $TARGET_DIR/.zshrc
ln -s $SRC_DIR/zsh/vringar.zsh-theme $TARGET_DIR/.oh-my-zsh/themes/vringar.zsh-theme
