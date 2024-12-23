# macOS Development Setup Script

This guide explains how to use the provided Bash script to set up a development environment on macOS. The script automates the installation of essential tools like Homebrew, Flutter, Xcode CLI, Android Studio, Git, GitHub Desktop, Visual Studio Code, Node.js, Postman.

## Prerequisites

- Ensure you have administrative privileges on your macOS system.
- A stable internet connection is required to download the tools.
- (Optional) Login to your Apple ID before running the script if you need to install Xcode from the App Store.

## Features

1. Installs **Homebrew**, a package manager for macOS.
2. Installs **Rosetta** (for Apple Silicon devices).
3. Installs **Flutter** via Homebrew.
4. Installs Xcode CLI and configures **Xcode** for iOS development.
5. Installs **CocoaPods** for managing iOS dependencies.
6. Installs **Android Studio** for Android development.
7. Installs **Node.js** for JavaScript development.
8. Installs **Git** for version control.
9. Installs **GitHub Desktop** for GUI-based Git management.
10. Installs **Visual Studio Code** for code editing.
11. Installs **Postman** for Test API
12. Runs `flutter doctor -v` to validate the setup.

## Usage

1. Clone this repository or download the script file.
2. Open a terminal and navigate to the directory containing the script.
3. Make the script executable:

   ```bash
   chmod +x setup_macos.sh
   ```

4. Run the script:

   ```bash
   ./setup_macos.sh
   ```

5. Enter your system password when prompted for `sudo` access. The script will keep the `sudo` session alive throughout its execution.

## Step-by-Step Actions Performed by the Script

1. **Homebrew Installation**:
   - Installs Homebrew if not already installed.
   - Configures Homebrew in your shell environment.

2. **Rosetta Installation**:
   - Installs Rosetta for Apple Silicon devices, enabling x86 apps to run.

3. **Flutter Installation**:
   - Installs Flutter SDK using Homebrew.

4. **Xcode Installation**:
   - Installs Xcode Command Line Tools.
   - Configures Xcode with the required licenses and platforms.

5. **CocoaPods Installation**:
   - Installs CocoaPods for managing iOS dependencies.

6. **Android Studio Installation**:
   - Installs Android Studio for Android development.

7. **Node.js Installation**:
   - Installs Node.js using Homebrew.

8. **Git Installation**:
   - Installs Git for version control.

9. **GitHub Desktop Installation**:
   - Installs GitHub Desktop for GUI-based Git management.

10. **Visual Studio Code Installation**:
    - Installs Visual Studio Code for code editing and development.

11. **Postman Installation**
    - Installs Postman for Test API

12. **Flutter Doctor**:
    - Validates the setup by running `flutter doctor -v`.

## Notes

- **Xcode**: Ensure you open Xcode manually after installation and accept the license agreement.
- **Android Studio**: Configure the Flutter and Dart plugins after installation.
- **Environment Variables**: Homebrew automatically manages PATH for installed tools. If any tools are not found, restart your terminal or run:

  ```bash
  source ~/.zprofile
  ```

## Troubleshooting

- If you encounter permission errors, ensure the script is run with sufficient privileges.
- For missing dependencies, re-run the script or install manually using Homebrew:

  ```bash
  brew install <package-name>
  ```

## Completion

Once the script completes successfully, your macOS development environment will be set up and ready for Flutter, iOS, and Android development.

Enjoy coding!
