#!/bin/bash

# Request sudo password upfront
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update the package list
echo "Updating package list..."
sudo apt update

# Install general development tools
echo "Installing general development tools..."
sudo apt install -y build-essential curl wget git unzip jq htop libnss3-tools xclip gpg lsb-release software-properties-common

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && sudo apt install -y code

# Install Visual Studio Code Extensions
echo "Installing VS Code Extensions..."
# Theme Extension
code --install-extension tinkertrain.theme-panda
echo "VS Code Panda Theme extension has been installed."

# Docker support
code --install-extension ms-azuretools.vscode-docker
echo "Docker extension for VS Code has been installed."

# Tailwind CSS IntelliSense
code --install-extension bradlc.vscode-tailwindcss
echo "Tailwind CSS IntelliSense extension has been installed."

# ESLint
code --install-extension dbaeumer.vscode-eslint
echo "ESLint extension has been installed."

# Prettier - Code formatter
code --install-extension esbenp.prettier-vscode
echo "Prettier - Code formatter extension has been installed."

# GitLens
code --install-extension eamodio.gitlens
echo "GitLens extension has been installed."

# Vetur for Vue.js
code --install-extension octref.vetur
echo "Vetur extension for Vue.js has been installed."

# Live Server
code --install-extension ritwickdey.LiveServer
echo "Live Server extension has been installed."

# Bracket Pair Colorizer
code --install-extension CoenraadS.bracket-pair-colorizer-2
echo "Bracket Pair Colorizer 2 extension has been installed."

# Auto Rename Tag
code --install-extension formulahendry.auto-rename-tag
echo "Auto Rename Tag extension has been installed."

# IntelliSense for CSS class names in HTML
code --install-extension Zignd.html-css-class-completion
echo "IntelliSense for CSS class names in HTML extension has been installed."

# JavaScript (ES6) code snippets
code --install-extension xabikos.JavaScriptSnippets
echo "JavaScript (ES6) snippets extension has been installed."

# Thunder Client for REST API Testing
code --install-extension rangav.vscode-thunder-client
echo "Thunder Client for REST API Testing has been installed."

# Live Share for real-time collaboration
code --install-extension MS-vsliveshare.vsliveshare
echo "VS Code Live Share extension has been installed."

# PHP Intelephense
code --install-extension bmewburn.vscode-intelephense-client
echo "PHP Intelephense extension has been installed."

# Laravel Extension Pack
code --install-extension onecentlin.laravel-extension-pack
echo "Laravel Extension Pack has been installed."

# Laravel Blade Snippets
code --install-extension onecentlin.laravel-blade
echo "Laravel Blade Snippets extension has been installed."

# Laravel Artisan
code --install-extension ryannaddy.laravel-artisan
echo "Laravel Artisan commands extension has been installed."

# Svelte for VS Code
code --install-extension svelte.svelte-vscode
echo "Svelte extension for VS Code has been installed."

# Install Postman
echo "Installing Postman..."
sudo snap install postman
echo "Postman has been installed."

# Install Python
echo "Installing Python..."
sudo apt install -y python3 python3-pip python3-venv

# Install PHP
echo "Installing PHP..."
sudo apt install -y php php-cli php-mbstring php-xml php-curl php-zip

# Install Composer
echo "Installing Composer..."
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

# Install Deployer for PHP deployments
echo "Installing Deployer..."
composer global require deployer/deployer
echo "Deployer has been installed."

# Ensure global composer bin is in PATH
echo "export PATH=\$PATH:$HOME/.config/composer/vendor/bin" >> ~/.bashrc
source ~/.bashrc

# Install Node.js using NVM (Node Version Manager)
echo "Installing NVM (Node Version Manager)..."
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Load NVM and install the latest LTS version of Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo "Installing the latest LTS version of Node.js..."
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "Node.js and npm have been installed:"
node -v
npm -v

# Configure and install Yarn
echo "Configuring Yarn repository..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "Installing Yarn..."
sudo apt update && sudo apt install -y yarn

echo "Yarn has been installed:"
yarn --version

# Install Docker
echo "Installing Docker..."
sudo apt install -y apt-transport-https ca-certificates gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION="v2.13.0"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install DDEV
echo "Installing DDEV..."
curl -LO https://raw.githubusercontent.com/drud/ddev/master/scripts/install_ddev.sh
bash install_ddev.sh
rm install_ddev.sh

# Install 1Password Desktop App
echo "Installing 1Password Desktop..."
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor -o /usr/share/keyrings/1password-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main" | sudo tee /etc/apt/sources.list.d/1password.list
sudo apt update && sudo apt install -y 1password

# Install Bitwarden Desktop App
echo "Installing Bitwarden Desktop App..."
sudo snap install bitwarden
echo "Bitwarden Desktop App has been installed."

# Install mkcert and trust store setup
echo "Installing mkcert..."
sudo apt install -y libnss3-tools
wget https://dl.filippo.io/mkcert/latest?for=linux/amd64 -O mkcert
chmod +x mkcert
sudo mv mkcert /usr/local/bin/
mkcert -install

# Install Redis
echo "Installing Redis..."
sudo apt install -y redis-server
sudo systemctl enable redis-server.service

# Install MySQL
echo "Installing MySQL..."
sudo apt install -y mysql-server
sudo systemctl enable mysql.service

# Install MongoDB
echo "Installing MongoDB..."
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [arch=amd64] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt update && sudo apt install -y mongodb-org
sudo systemctl enable mongod

# Install Go
echo "Installing Go..."
GO_VERSION="1.20.5"
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
source ~/.profile
rm go${GO_VERSION}.linux-amd64.tar.gz

# Install AWS CLI
echo "Installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Install Terraform
echo "Installing Terraform..."
wget -q -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

# Install pipx for managing isolated Python environments
echo "Installing pipx..."
sudo apt install -y pipx
pipx ensurepath

# Install sgpt via pipx
echo "Installing sgpt via pipx..."
pipx install shell-gpt

# Reload profile to update PATH, effective in new terminal sessions
echo "source $HOME/.bashrc" >> $HOME/.bash_profile

# Check if sgpt is available in the PATH
echo "Checking if sgpt is in PATH..."
which sgpt || echo "sgpt not found in PATH"

# Additional check to verify sgpt installation
if ! which sgpt > /dev/null; then
    echo "sgpt command not found, please check installation."
else
    echo "sgpt command is available."
fi

# Clean up
echo "Cleaning up..."
sudo apt autoremove -y
sudo apt clean

echo "Development tools installation completed!"
