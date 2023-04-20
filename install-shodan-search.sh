#!/bin/bash

# Define variables for the script
SCRIPT_NAME="shodan-search"
SCRIPT_FILENAME="${SCRIPT_NAME}.sh"
INSTALL_LOCATION="/usr/local/bin"
SCRIPT_LOCATION="$(pwd)/${SCRIPT_FILENAME}"
LINK_NAME="${INSTALL_LOCATION}/${SCRIPT_NAME}"

# Check if the script is already installed
if [ -f "$LINK_NAME" ]; then
  echo "The script is already installed at $LINK_NAME."
  exit 0
fi

# Copy the script to the install location
sudo cp "$SCRIPT_LOCATION" "$INSTALL_LOCATION"

# Create a symbolic link to the script
sudo ln -s "${INSTALL_LOCATION}/${SCRIPT_FILENAME}" "$LINK_NAME"

# Make the script executable
sudo chmod +x "${INSTALL_LOCATION}/${SCRIPT_FILENAME}"

echo "The script has been installed at $LINK_NAME."
