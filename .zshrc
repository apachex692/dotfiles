echo 'Hello, Apache! 🚁'

PROMPT="%F{cyan}%n%f@%B%F{green}%m%f%b %F{yellow}%~%f
➡️  "
RPROMPT="%F{white}[%?]%f %(?..%F{red}⚠%f) 🚁"

export PATH="$PATH:$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$HOME/.npm/packages/bin:$HOME/.go/bin/"
export GOPATH="$HOME/.go/"

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
HISTSIZE=1000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS

# Enable Command Auto-correction
setopt correct

# Enable Command Suggestions Based on History
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

export PNPM_HOME='/Users/sakthi/Library/pnpm'
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Aliases
[[ -f "$HOME/.zsh_aliases/always" ]] && source "$HOME/.zsh_aliases/always"
