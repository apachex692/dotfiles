# Author: Apache X692
# Created on: 06/12/2024
apt update && apt upgrade -y

# Packages
apt install tmux tree git python3 git gnupg unzip apt-transport-https software-properties-common -y

# Go
wget -O ./go.tar.gz https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
rm -rf /usr/local/go/
tar -C /usr/local/ -xzf ./go.tar.gz
rm ./go.tar.gz

# UV
curl -LsSf https://astral.sh/uv/install.sh | sh

# Docker
curl https://get.docker.com | sh
usermod -a -G docker admin

# Terraform
wget -O - https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
  tee /etc/apt/sources.list.d/hashicorp.list

apt update && apt install terraform -y

# Kubernetes CLI
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 ./kubectl /usr/local/bin/kubectl

# Kustomize
curl "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
mv ./kustomize /usr/local/bin/

# Helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | \
  tee /usr/share/keyrings/helm.gpg > /dev/null

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] \
  https://baltocdn.com/helm/stable/debian/ all main" | \
  tee /etc/apt/sources.list.d/helm-stable-debian.list

apt update && apt install helm

# AWS CLI V2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o ./awscliv2.zip
unzip ./awscliv2.zip
./aws/install

rm -r ./aws/ ./awscliv2.zip ./kubectl
