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
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        source ~/.zprofile
    else
        echo "Homebrew version $HOMEBREW_VERSION is up to date."
    fi
else
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    source ~/.zprofile
fi

# Verify Homebrew setup
if ! command_exists brew; then
    echo "Homebrew setup failed. Uninstalling..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    source ~/.zprofile
else
    echo "Homebrew setup succeeded. Please close and reopen your terminal to apply changes."
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

# Check if Xcode App is installed
if [ -d "/Applications/Xcode.app" ]; then
    echo "Xcode is installed."

    # Install Xcode CLI
    if ! command_exists xcodebuild; then
        echo "Installing Xcode Command Line Tools..."
        xcode-select --install
        echo "Please install Xcode from the App Store and open it once to accept the license agreement."
         # Configure Xcode
        echo "Configuring xcode ..."
        sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
        echo "Xcode license accept"
        sudo xcodebuild -license accept
        xcodebuild -downloadPlatform iOS
        brew install ideviceinstaller
    else
        echo "Xcode Command Line Tools are already installed."
    fi

else
    echo "Xcode is not installed. Please install Xcode from the App Store."
    exit 1
fi

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
    echo 'export ANDROID_HOME=~/Library/Android/sdk' >> ~/.zprofile
    echo 'export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"' >> ~/.zprofile
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

GIT_EMAIL="tussuya423t@gmail.com"
GIT_NAME="genss333"

# Install Git
if ! command_exists git; then
    echo "Installing Git..."
    brew install git
    source ~/.zprofile
    echo "Configuring Git..."
    git global config --global user.email "$GIT_EMAIL"
    git global config --global user.name "$GIT_NAME"
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

# Install postman
if ! command_exists postman; then
    echo "Installing Postman..."
    brew install --cask postman
else
    echo "Postman is already installed."
fi

# Install Chrome
if ! command_exists google-chrome; then
    echo "Installing Google Chrome..."
    brew install --cask google-chrome
else
    echo "Google Chrome is already installed."
fi

# Run Flutter doctor
echo "Running Flutter doctor..."
flutter doctor -v

# Completion message
echo "Setup is complete. for Flutter development."
