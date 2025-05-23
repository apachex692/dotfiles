alias ll='ls -alht'
alias mkcd='function _mkcd() { mkdir -p "$1" && cd "$1"; }; _mkcd'

alias tf='terraform'
alias tfp='terraform plan'
alias tff='terraform fmt'
alias tfa='terraform apply'
alias tfd='terraform destroy'
alias tfaa='terraform apply --auto-approve'
alias tfda='terraform destroy --auto-approve'

alias p='python'
alias d='docker'
alias k='kubectl'
alias kk='kustomize'
alias h='helm'

alias vscode='nohup /home/admin/.local/bin/code tunnel > /dev/null 2>&1 &'
