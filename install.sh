#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

# Get the absolute path to the aliases file
ALIASES_PATH="$(pwd)/shell/aliases.sh"

# Source command to add to .bashrc
SOURCE_CMD="source \"$ALIASES_PATH\""

# Path to user's .bashrc
BASHRC_PATH="$HOME/.bashrc"

# Check if .bashrc exists
if [ -f "$BASHRC_PATH" ]; then
    # Check if the source command is already in .bashrc
    if ! grep -qF "$SOURCE_CMD" "$BASHRC_PATH"; then
        echo "" >> "$BASHRC_PATH"
        echo "# Load custom aliases from dotfiles" >> "$BASHRC_PATH"
        echo "$SOURCE_CMD" >> "$BASHRC_PATH"
        echo "Added aliases to $BASHRC_PATH"
    else
        echo "Aliases already sourced in $BASHRC_PATH"
    fi
else
    echo "Warning: $BASHRC_PATH not found. Creating it..."
    echo "# Load custom aliases from dotfiles" > "$BASHRC_PATH"
    echo "$SOURCE_CMD" >> "$BASHRC_PATH"
    echo "Created $BASHRC_PATH and added aliases"
fi

echo "Installation complete! Please run 'source ~/.bashrc' or restart your terminal."
