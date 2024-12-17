#!/bin/bash
# Author: Apache X692
# Created on: 06/12/2024
#
# Control Panel
set -e

TIMEZONE='Asia/Kolkata'
HOSTNAME='rdev-machine-001'
USER=$(awk -F: '$3 == 1000 { print $1 }' /etc/passwd)

INSTALL_GO=true
INSTALL_UV=true
INSTALL_DOCKER=true
INSTALL_TERRAFORM=true
INSTALL_KUBECTL=true
INSTALL_KUSTOMIZE=true
INSTALL_HELM=true
INSTALL_AWS_CLI=true
INSTALL_VSCODE=true

# System Update
apt update && apt upgrade -y

# Packages
apt install tmux tree git python3 git gnupg unzip apt-transport-https software-properties-common -y

# Go
if [ "$INSTALL_GO" = true ]; then
  wget -O ./go.tar.gz https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
  rm -rf /usr/local/go/
  tar -C /usr/local/ -xzf ./go.tar.gz
  rm ./go.tar.gz
fi

# UV
if [ "$INSTALL_UV" = true ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi

# Docker
if [ "$INSTALL_DOCKER" = true ]; then
  curl https://get.docker.com | sh
  usermod -a -G docker admin
fi

# Terraform
if [ "$INSTALL_TERRAFORM" = true ]; then
  wget -O - https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list

  apt update && apt install terraform -y
fi

# Kubernetes CLI
if [ "$INSTALL_KUBECTL" = true ]; then
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  install -o root -g root -m 0755 ./kubectl /usr/local/bin/kubectl
  rm -f ./kubectl
fi

# Kustomize
if [ "$INSTALL_KUSTOMIZE" = true ]; then
  curl "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
  mv ./kustomize /usr/local/bin/
fi

# Helm
if [ "$INSTALL_HELM" = true ]; then
  curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | \
    tee /usr/share/keyrings/helm.gpg > /dev/null

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] \
    https://baltocdn.com/helm/stable/debian/ all main" | \
    tee /etc/apt/sources.list.d/helm-stable-debian.list

  apt update && apt install helm
fi

# AWS CLI V2
if [ "$INSTALL_AWS_CLI" = true ]; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ./awscliv2.zip
  unzip ./awscliv2.zip
  ./aws/install
  rm -r ./aws/ ./awscliv2.zip
  completion -C $(which aws_completer) aws
fi

# VS Code
if [ "$INSTALL_VSCODE" = true ]; then
    su - admin -c "wget -O ./code.tar.gz 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64'"
    su - admin -c "tar -x -z -f ./code.tar.gz"
    su - admin -c "mkdir -p ./.local/bin/ && mv ./code ./.local/bin/"
    su - admin -c "rm ./code.tar.gz"
fi

# Configurations: Aliases
cat <<EOF > /home/$USER/.bash_aliases
alias ll='ls -alh'
alias mkcd='function _mkcd() { mkdir -p "$1" && cd "$1"; }; _mkcd'

alias tf='terraform'
alias tfp='terraform plan'
alias tff='terraform fmt'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfaa='terraform apply --auto-approve'
alias tfda='terraform destroy --auto-approve'

alias p='python'
alias k='kubectl'
alias kk='kustomize'
alias h='helm'

alias vscode='nohup /home/admin/.local/bin/code tunnel > /dev/null 2>&1 &'

alias d='docker'
alias dcsr='docker stop $1; docker rm $1'
EOF

# Kubectl Auto-completion
echo 'source <(kubectl completion bash)' >> ~/.bashrc
echo 'complete -o default -F __start_kubectl k' >> ~/.bashrc

# Git Config
cat <<EOF > /home/$USER/.gitconfig
[user]
    email = mail@sakthisanthosh.in
    name = Apache X692
[init]
    defaultbranch = main
EOF

# VIM RC
cat <<EOF > /home/$USER/.vimrc
set expandtab
set shiftwidth=2
set softtabstop=2

set number
set relativenumber

syntax on

set autoindent
set smartindent
filetype indent on

highlight Comment cterm=italic gui=italic
EOF

# tmux
cat <<EOF > /home/$USER/.tmux.conf
set -g status on
set -g status-interval 60
set -g status-justify centre
set -g status-bg black
set -g status-fg white
set -g status-left-length 50
set -g status-right-length 100

set -g status-left "#[bold]W#I#[default]/S#S"
set -g status-right "#(date '+%d/%m/%Y | %H:%M') | 🚁"

setw -g window-status-format "[#I]#W"
setw -g window-status-current-format "#[fg=yellow,bold][#I]#W#[default]"
setw -g window-status-separator " | "

bind-key r source-file ~/.tmux.conf \; display-message "Apache X692"
EOF

sudo timedatectl set-timezone "$TIMEZONE"
sudo hostnamectl set-hostname "$HOSTNAME"

echo 'export PATH="$PATH:/usr/local/go/bin"' >> /home/$USER/.bashrc
