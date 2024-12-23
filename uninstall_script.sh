#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Uninstall Rosetta for Apple Silicon
if [[ $(uname -m) == 'arm64' ]]; then
    echo "Rosetta cannot be uninstalled directly. Skipping."
else
    echo "Rosetta is not installed on this system."
fi

# Uninstall Flutter
if command_exists flutter; then
    echo "Uninstalling Flutter..."
    brew uninstall --cask flutter
else
    echo "Flutter is not installed. Skipping."
fi

# Uninstall Xcode Command Line Tools
if command_exists xcodebuild; then
    echo "Uninstalling Xcode Command Line Tools..."
    sudo rm -rf /Library/Developer/CommandLineTools
else
    echo "Xcode Command Line Tools are not installed. Skipping."
fi

# Uninstall CocoaPods
if command_exists pod; then
    echo "Uninstalling CocoaPods..."
    sudo gem uninstall cocoapods
else
    echo "CocoaPods is not installed. Skipping."
fi

# Uninstall Android Studio
if command_exists studio; then
    echo "Uninstalling Android Studio..."
    brew uninstall --cask android-studio
else
    echo "Android Studio is not installed. Skipping."
fi

# Uninstall Node.js
if command_exists node; then
    echo "Uninstalling Node.js..."
    brew uninstall node; 
    brew cleanup;
    rm -f /usr/local/bin/npm /usr/local/lib/dtrace/node.d;
    rm -rf ~/.npm;
else
    echo "Node.js is not installed. Skipping."
fi

# Uninstall Git
if command_exists git; then
    echo "Uninstalling Git..."
    brew uninstall git
else
    echo "Git is not installed. Skipping."
fi

# Uninstall GitHub Desktop
if command_exists github; then
    echo "Uninstalling GitHub Desktop..."
    brew uninstall --cask github
else
    echo "GitHub Desktop is not installed. Skipping."
fi

# Uninstall Visual Studio Code
if command_exists code; then
    echo "Uninstalling Visual Studio Code..."
    brew uninstall --cask visual-studio-code
else
    echo "Visual Studio Code is not installed. Skipping."
fi

# Uninstall Homebrew
if command_exists brew; then
    echo "Uninstalling Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
else
    echo "Homebrew is not installed. Skipping."
fi

# Completion message
echo "Uninstallation complete. Please manually verify if any dependencies remain."
