#!/bin/bash

# === Set up paths ===
echo "🔧 Configuring PATHs..."

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Add to shell config
SHELL_RC="$HOME/.bashrc"
[[ $SHELL == */zsh ]] && SHELL_RC="$HOME/.zshrc"

echo 'export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/bob/nvim-bin:$PATH"' >> $SHELL_RC

# === Install Python & codespell ===
echo "🐍 Installing codespell (Python)..."
pip install --user codespell

# === Install Rust + Cargo ===
if ! command -v rustc &>/dev/null; then
    echo "🦀 Installing Rust via rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "✅ Rust already installed."
fi

# === Install bob (Neovim version manager) ===
echo "🧠 Installing bob (Neovim manager)..."
cargo install bob-nvim
bob install stable
bob use stable

# === Install nvm + Node.js + Prettier ===
echo "📦 Installing Node.js via nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

echo "💅 Installing Prettier..."
npm install -g prettier

# Final message
echo
echo "✅ All tools installed!"
echo "🧠 Restart your shell or run: source $SHELL_RC"
echo "✨ Then run: nvim --version"
