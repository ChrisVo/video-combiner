#!/bin/bash

# Installation script for combine-videos
# This script will install combine-videos to /usr/local/bin

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="combine-videos"
INSTALL_PATH="/usr/local/bin/$SCRIPT_NAME"

echo "Installing $SCRIPT_NAME..."

# Check if /usr/local/bin exists, create if it doesn't
if [ ! -d "/usr/local/bin" ]; then
    echo "Creating /usr/local/bin directory..."
    sudo mkdir -p /usr/local/bin
fi

# Copy the script
echo "Copying $SCRIPT_NAME to $INSTALL_PATH..."
sudo cp "$SCRIPT_DIR/$SCRIPT_NAME" "$INSTALL_PATH"

# Set proper permissions
echo "Setting permissions..."
sudo chmod 755 "$INSTALL_PATH"

# Verify installation
if [ -x "$INSTALL_PATH" ]; then
    echo "✓ Successfully installed $SCRIPT_NAME to $INSTALL_PATH"
    echo ""
    echo "You can now use '$SCRIPT_NAME' from anywhere on your system:"
    echo "  $SCRIPT_NAME video1.mp4 video2.mp4 video3.mp4 ..."
else
    echo "✗ Installation failed"
    exit 1
fi
