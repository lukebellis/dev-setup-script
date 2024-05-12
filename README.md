### Development Environment Setup Script for Ubuntu 24 LTS

This script automates the process of setting up a comprehensive development environment tailored for modern software development. It includes a wide array of tools ranging from code editors and API clients to databases and containerisation technologies.

#### What Does This Script Do?

1.  Updates your system's package list to ensure that all software installations get the latest versions available.

2.  Installs a variety of development tools:
    -   General tools: Includes essentials like curl, wget, git, and more for basic development operations.
    -   Visual Studio Code: Installs VS Code, a popular editor among developers for coding in various languages.
    -   Postman: Sets up Postman for testing APIs.
    -   Programming languages and environment management: Installs Python, PHP, Node.js (via NVM), and Go, along with essential tools like Composer for PHP and pipx for isolated Python environment management.
    -   Version control and secure storage: Tools like 1Password and Bitwarden for secure password management.

3.  Sets up containerisation and virtualisation tools:
    -   Docker and Docker Compose: For managing and deploying software in containers.
    -   DDEV: A tool that simplifies the setup and management of local development environments.

4.  Installs several databases:
    -   Redis: An in-memory data structure store.
    -   MySQL and MongoDB: Popular SQL and NoSQL database systems.

5.  Security and certificates:
    -   mkcert: For creating trusted certificates for your local development environment.

6.  Cloud and infrastructure management tools:
    -   AWS CLI and Terraform: For managing cloud resources and infrastructure.

7.  Installs Yarn: A fast, reliable, and secure dependency management tool.

#### Installation Guide:

1.  Download the Script: Ensure you have a local copy of the script on your Ubuntu machine.

2.  Make the Script Executable: Change the permission of the script file to make it executable using the command:

    `chmod +x install_dev_tools.sh`

3.  Run the Script: Execute the script with administrative privileges:

    `sudo ./install_dev_tools.sh `

4.  Follow Through: The script will execute each installation step while providing status updates. Enter your password when prompted.

#### Important Notes:

-   The script is designed for Ubuntu 24 LTS. Running it on other versions or distributions might require modifications.
-   Ensure you have a stable internet connection before running the script as it downloads software from various sources.
-   Review and modify the script if necessary to match your specific needs or to exclude components you may not require.

Thank you for using this script to set up your development environment efficiently and effectively!
