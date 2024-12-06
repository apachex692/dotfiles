. "$HOME/.local/bin/env"

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

export PATH=$PATH:/usr/local/go/bin
