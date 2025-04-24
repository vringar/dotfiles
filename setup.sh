#!/usr/bin/env zsh
set -ex

[[ -v ZSH ]] || sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
if ! grep -q nixos /etc/os-release; then
    if ! command -v rustup &>/dev/null; then
        echo "rustup not found. Installing..."

        # Run the rustup installer script
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

        # Add the cargo binary directory to the PATH
        export PATH="$HOME/.cargo/bin:$PATH"

        # Source the shell profile to apply changes
        source "$HOME/.zshrc"
    else
        rustup update
    fi
    # Install alacritty, starship
    cargo install alacritty starship bat
else
    echo "This is nixos"
fi

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
mkdir -p "$HOME/.config/plasma-workspace/env/"
ln -sf "$SRC_DIR/KDE/path.sh" "$HOME/.config/plasma-workspace/env/path.sh"

# Starship
ln -sf "$SRC_DIR/other/starship.toml" "$HOME/.config/starship.toml"

# Alacritty
mkdir -p "$HOME/.config/alacritty/"
ln -sf "$SRC_DIR/other/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"


#SSH
if ! grep -q nixos /etc/os-release; then
    systemctl --user enable ssh-agent.service
    systemctl --user start ssh-agent.service
fi
echo "Setup ran to completion"
