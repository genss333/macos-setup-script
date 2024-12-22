#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Homebrew
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$($(brew --prefix)/bin/brew shellenv)"' >> ~/.zprofile
    eval "$($(brew --prefix)/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Install Rosetta for Apple Silicon
if [[ $(uname -m) == 'arm64' ]]; then
    echo "Installing Rosetta..."
    sudo softwareupdate --install-rosetta --agree-to-license
else
    echo "Rosetta is not required on this system."
fi

# Install Flutter via Homebrew
if ! command_exists flutter; then
    echo "Installing Flutter via Homebrew..."
    brew install --cask flutter
else
    echo "Flutter is already installed via Homebrew."
fi

# Install Xcode
if ! command_exists xcodebuild; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please install Xcode from the App Store and open it once to accept the license agreement."
else
    echo "Xcode Command Line Tools are already installed."
fi

# Configure Xcode
sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
sudo xcodebuild -license accept
xcodebuild -downloadPlatform iOS

# Install CocoaPods
if ! command_exists pod; then
    echo "Installing CocoaPods..."
    sudo gem install cocoapods
    echo 'export PATH=$HOME/.gem/bin:$PATH' >> ~/.zprofile
    source ~/.zprofile
else
    echo "CocoaPods is already installed."
fi

# Install Android Studio
if ! command_exists studio; then
    echo "Installing Android Studio..."
    brew install --cask android-studio
else
    echo "Android Studio is already installed."
fi

# Install Node.js
if ! command_exists node; then
    echo "Installing Node.js..."
    brew install node
else
    echo "Node.js is already installed."
fi

# Install Git
if ! command_exists git; then
    echo "Installing Git..."
    brew install git
else
    echo "Git is already installed."
fi

# Install GitHub Desktop
if ! command_exists github; then
    echo "Installing GitHub Desktop..."
    brew install --cask github
else
    echo "GitHub Desktop is already installed."
fi

# Install Visual Studio Code
if ! command_exists code; then
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
else
    echo "Visual Studio Code is already installed."
fi

# Run Flutter doctor
echo "Running Flutter doctor..."
flutter doctor -v

# Completion message
echo "Setup is complete. Please ensure you configure Android Studio and Xcode properly for Flutter development."
