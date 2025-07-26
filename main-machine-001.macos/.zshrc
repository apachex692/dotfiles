apache() {
  echo '    ___    ____  ___   ________  ________   _  _______ ____ ___
   /   |  / __ \/   | / ____/ / / / ____/  | |/ / ___// __ \__ \
  / /| | / /_/ / /| |/ /   / /_/ / __/     |   / __ \/ /_/ /_/ /
 / ___ |/ ____/ ___ / /___/ __  / /___    /   / /_/ /\__, / __/
/_/  |_/_/   /_/  |_\____/_/ /_/_____/   /_/|_\____//____/____/

                            🚁🚁🚁🚁🚁
                   Engineering as \e[3mResponsibility\e[0m
'
}

PROMPT="%F{cyan}%n%f@%B%F{green}%m%f%b %F{yellow}%~%f
➡️  "
RPROMPT="%F{white}[%?]%f %(?..%F{red}⚠%f) 🚁"

fpath=($fpath $HOME/.local/share/zsh/completions/)

export PATH="$PATH:$HOME/.local/bin:$HOME/Library/Python/3.9/bin:$HOME/.npm/global-packages/bin:$HOME/.go/bin/"
export MANPATH="$MANPATH:$HOME/.local/share/man"
export GOPATH="$HOME/.go/"

# Enable Zsh Completion
autoload -U compinit
compinit -i # -i: Allow Loading Completions from User-defined Directories

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
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000

# Enable Command Auto-correction
setopt correct

# Enable Command Suggestions Based on History
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

[[ -f "$HOME/.zsh_aliases/always" ]] && source "$HOME/.zsh_aliases/always"

apache
