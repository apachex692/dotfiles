echo "Hello, Apache! 🚁"

PROMPT="%F{cyan}%n%f@%B%F{green}%m%f%b %F{yellow}%~%f
➡️  "
RPROMPT="%F{white}[%?]%f %(?..%F{red}⚠%f) 🚁"

export PATH="$PATH:$HOME/.local/bin/"

alias ll='ls -alh'

. "$HOME/.local/bin/env"

# Enable Zsh Completion
autoload -Uz compinit
compinit -C # With Compiled Cache

# Enable Menu Selection
zstyle ':completion:*' menu select

# Enable Case-insensitive Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Show Descriptions for Completions
zstyle ':completion:*' format '%B%d%b'

# Smarter Tab Completion with a List
zstyle ':completion:*' completer _complete _match _approximate

# Allow Completing Hidden Files (starting with .)
zstyle ':completion:*' special-dirs true

# Load History and Improve Command Recall
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS

# Enable Command Auto-correction
setopt correct

# Enable Shared History Across Sessions
setopt SHARE_HISTORY

# Enable Command Suggestions Based on History
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
