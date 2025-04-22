#!/bin/zsh
#
# Author: Apache X692
# Created on: 04/22/2025
NVIM_PLUGIN_DIR="$HOME/.config/nvim/pack/others/start"
PLUGINS=(
  "copilot.vim"
  "fzf"
)

mkdir -p "$NVIM_PLUGIN_DIR"

echo "Setting-up: copilot.vim"
git clone -q https://github.com/github/copilot.vim.git \
    "$NVIM_PLUGIN_DIR/copilit.vim"

echo "Setting-up: fzf"
mkdir -p "$NVIM_PLUGIN_DIR/fzf/plugin"
cp ./.config/nvim/pack/others/start/fzf/plugin/fzf.vim \
    "$NVIM_PLUGIN_DIR/fzf/plugin"
