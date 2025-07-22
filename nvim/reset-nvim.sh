#!/bin/bash
#
# Resets the Neovim environment by deleting all installed plugins,
# language servers, and cached data. This script does NOT touch your
# personal configuration files.
#
# This is useful for resolving persistent, hard-to-debug issues.

set -e # Exit immediately if a command exits with a non-zero status.

# Define standard Neovim data directories
NVIM_DATA_DIR="$HOME/.local/share/nvim"
NVIM_STATE_DIR="$HOME/.local/state/nvim"
NVIM_CACHE_DIR="$HOME/.cache/nvim"

echo "This script will completely reset your Neovim environment by deleting the following directories:"
echo "  - $NVIM_DATA_DIR (Plugins, LSPs, Treesitter parsers)"
echo "  - $NVIM_STATE_DIR (Session/shada files)"
echo "  - $NVIM_CACHE_DIR (Cached data)"
echo ""
read -p "Are you sure you want to continue? (y/n) " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo "Operation cancelled."
    exit 1
fi

echo "Deleting Neovim data, state, and cache directories..."

rm -rf "$NVIM_DATA_DIR"
rm -rf "$NVIM_STATE_DIR"
rm -rf "$NVIM_CACHE_DIR"

echo ""
echo "✅ Neovim environment has been reset."
echo ""
echo "➡️ Next steps:"
echo "   1. Start Neovim ('nvim')."
echo "   2. Run ':PlugInstall' to reinstall all your plugins."
echo "   3. Quit and restart Neovim."
echo "   4. Run ':TSUpdate' to reinstall all Treesitter parsers."
echo "   5. LSPs will be installed automatically by Mason on the next startup."
echo "   6. Run ':checkhealth' to verify that everything is working correctly."
