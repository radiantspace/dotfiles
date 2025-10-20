#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

# Get the absolute path to the aliases file
ALIASES_PATH="$(cd "$(dirname "${BASH_SOURCE}")" && pwd)/shell/aliases.sh"

# Source command to add to .bashrc
SOURCE_CMD="source \"$ALIASES_PATH\""

# Marker comment to identify dotfiles entry
MARKER="# Load custom aliases from dotfiles"

# Path to user's .bashrc
BASHRC_PATH="$HOME/.bashrc"

# Check if .bashrc exists
if [ -f "$BASHRC_PATH" ]; then
    # Check if the marker comment is already in .bashrc
    if grep -qF "$MARKER" "$BASHRC_PATH"; then
        # Check if the exact source command matches
        if ! grep -qF "$SOURCE_CMD" "$BASHRC_PATH"; then
            # Marker exists but path is different - update it
            # Find the line after the marker and replace it
            sed -i "/^${MARKER//\//\\/}\$/,+1 s|^source .*aliases\.sh\".*|$SOURCE_CMD|" "$BASHRC_PATH"
            echo "Updated aliases path in $BASHRC_PATH"
        else
            echo "Aliases already sourced in $BASHRC_PATH"
        fi
    else
        # Marker doesn't exist - add it
        echo "" >> "$BASHRC_PATH"
        echo "$MARKER" >> "$BASHRC_PATH"
        echo "$SOURCE_CMD" >> "$BASHRC_PATH"
        echo "Added aliases to $BASHRC_PATH"
    fi
else
    echo "Warning: $BASHRC_PATH not found. Creating it..."
    echo "$MARKER" > "$BASHRC_PATH"
    echo "$SOURCE_CMD" >> "$BASHRC_PATH"
    echo "Created $BASHRC_PATH and added aliases"
fi

echo "Installation complete! Please run 'source ~/.bashrc' or restart your terminal."
