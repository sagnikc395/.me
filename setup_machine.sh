#!/bin/zsh 

# setup homebrew first / asdf if on linux  
# Check if the script is running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing homebrew for macOS..."
    # Command to install file on macOS
    # Example: cp file_for_macos /path/to/installation/directory
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # Check if the script is running on Linux/WSL
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        echo "Installing asdf for Linux/WSL..."
        # Command to install file on Linux/WSL
        # Example: cp file_for_linux /path/to/installation/directory
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
        . "$HOME/.asdf/asdf.sh"
        . "$HOME/.asdf/completions/asdf.bash"
    else
        echo "Unsupported operating system."
        exit -1
    fi
fi

# for making reproducible machines 
brew install go node volta pnpm  chezmoi 

# monaspace fonts ftw 
brew tap homebrew/cask-fonts
brew install font-monaspace


