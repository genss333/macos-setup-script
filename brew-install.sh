#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install or Update Homebrew
if command_exists brew; then
    echo "Checking Homebrew version..."
    HOMEBREW_VERSION=$(brew --version | head -n 1 | awk '{print $2}')
    REQUIRED_VERSION="3.0.0"

    if [[ "$HOMEBREW_VERSION" < "$REQUIRED_VERSION" ]]; then
        echo "Homebrew version $HOMEBREW_VERSION found but is outdated. Uninstalling..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
        echo "Reinstalling Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zprofile
    else
        echo "Homebrew version $HOMEBREW_VERSION is up to date."
    fi
else
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zprofile
fi
