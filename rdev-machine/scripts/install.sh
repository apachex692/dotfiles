#!/bin/bash
#
# Author: Apache X692
# Created on: 06/12/2024
#
# Tested on: Debian 12
# Arcitecture: x86_64
set -e

echo "Settings"

read -p "  Timezone (default: Asia/Kolkata): " TIMEZONE
TIMEZONE=${TIMEZONE:-Asia/Kolkata}

read -p "  Hostname (default: rdev-machine-001): " HOSTNAME
HOSTNAME=${HOSTNAME:-rdev-machine-001}

read -p "  Install Go? (y/n, default: y): " INSTALL_GO
INSTALL_GO=${INSTALL_GO:-y}

read -p "  Install UV? (y/n, default: y): " INSTALL_UV
INSTALL_UV=${INSTALL_UV:-y}

read -p "  Install Docker? (y/n, default: y): " INSTALL_DOCKER
INSTALL_DOCKER=${INSTALL_DOCKER:-y}

read -p "  Install Terraform? (y/n, default: y): " INSTALL_TERRAFORM
INSTALL_TERRAFORM=${INSTALL_TERRAFORM:-y}

read -p "  Install kubectl? (y/n, default: y): " INSTALL_KUBECTL
INSTALL_KUBECTL=${INSTALL_KUBECTL:-y}

read -p "  Install Kustomize? (y/n, default: y): " INSTALL_KUSTOMIZE
INSTALL_KUSTOMIZE=${INSTALL_KUSTOMIZE:-y}

read -p "  Install Helm? (y/n, default: y): " INSTALL_HELM
INSTALL_HELM=${INSTALL_HELM:-y}

read -p "  Install AWS CLI? (y/n, default: y): " INSTALL_AWS_CLI
INSTALL_AWS_CLI=${INSTALL_AWS_CLI:-y}

read -p "  Install Azure CLI? (y/n, default: y): " INSTALL_AZURE_CLI
INSTALL_AZURE_CLI=${INSTALL_AZURE_CLI:-y}

read -p "  Install VS Code? (y/n, default: y): " INSTALL_VSCODE
INSTALL_VSCODE=${INSTALL_VSCODE:-y}

read -p "  Install Dot Files? (y/n, default: y): " INSTALL_VSCODE
INSTALL_DOTFILES=${INSTALL_DOTFILES:-y}

# Time Zone
sudo timedatectl set-timezone "$TIMEZONE"

# Hostname
sudo hostnamectl set-hostname "$HOSTNAME"

# System Update
sudo apt update && sudo apt upgrade -y

# Packages
sudo apt install \
  tmux tree git python3 git gnupg unzip apt-transport-https \
  curl software-properties-common ca-certificates lsb-release \
  -y

# Harden System
curl "https://sakthisanthosh.in/assets/scripts/harden.sh" | sh

if [ "$INSTALL_GO" = "y" ]; then
  wget -O ~/go.tar.gz https://go.dev/dl/go1.23.5.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go/
  sudo tar -C /usr/local/ -xzf ~/go.tar.gz
  rm ~/go.tar.gz

  echo "Installed: Go (1.23.5)"
fi

if [ "$INSTALL_UV" = "y" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh

  echo "Installed: UV (latest)"
fi

if [ "$INSTALL_DOCKER" = "y" ]; then
  curl https://get.docker.com | sh
  sudo usermod -aG docker $USER

  echo "Installed: Docker (latest)"
fi

if [ "$INSTALL_TERRAFORM" = "y" ]; then
  wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform

  echo "Installed: Terraform (latest)"
fi

if [ "$INSTALL_KUBECTL" = "y" ]; then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  rm -f ~/kubectl

  echo "Installed: kubectl (latest)"
fi

if [ "$INSTALL_KUSTOMIZE" = "y" ]; then
  curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/latest/download/kustomize_linux_amd64"
  sudo install -o root -g root -m 0755 kustomize_linux_amd64 /usr/local/bin/kustomize
  rm -f ./kustomize_linux_amd64

  echo "Installed: Kustomize (latest)"
fi

if [ "$INSTALL_HELM" = "y" ]; then
  curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
  sudo apt-get update && sudo apt-get install helm

  echo "Installed: Helm (latest)"
fi

if [ "$INSTALL_AWS_CLI" = "y" ]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  rm -rf ~/aws/ ~/awscliv2.zip

  echo "Installed: AWS CLI (latest)"
fi

if [ "$INSTALL_AZURE_CLI" = "y" ]; then
  sudo mkdir -p /etc/apt/keyrings/
  curl -sLS https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
  sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
  AZ_DIST=$(lsb_release -cs)
  echo "Types: deb
    URIs: https://packages.microsoft.com/repos/azure-cli/
    Suites: ${AZ_DIST}
    Components: main
    Architectures: $(dpkg --print-architecture)
    Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
    sudo apt-get update && sudo apt-get install azure-cli

    echo "Installed: Azure CLI (latest)"
fi

if [ "$INSTALL_VSCODE" = "y" ]; then
  wget -O ~/code.tar.gz "https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64"
  tar -xzf ~/code.tar.gz -C ~/
  mkdir -p ~/.local/bin/ && mv ~/code ~/.local/bin/
  rm -f ~/code.tar.gz

  echo "Installed: VS Code (latest)"
fi

if [ "$INSTALL_DOTFILES" = "y" ]; then
  base_url="https://sakthisanthosh.in/assets/dotfiles"
  slugs=(".bash_aliases" ".tmux.conf" ".vimrc" ".gitconfig")

  for slug in "${slugs[@]}"; do
    curl "${base_url}/${slug}" > "${HOME}/${slug}"
  done

  curl "${base_url}/.bashrc" >> ~/.bashrc
fi

echo "Installation completed without any errors!"
