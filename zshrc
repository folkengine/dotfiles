# ~/.zshrc — Zsh interactive shell configuration
# Sourced for every new interactive Zsh session.

# ── History ───────────────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=20000
setopt SHARE_HISTORY        # share history across all sessions
setopt HIST_IGNORE_DUPS     # don't record duplicate commands
setopt HIST_IGNORE_SPACE    # ignore commands starting with a space
setopt HIST_VERIFY          # show command before executing from history

# ── Completion ────────────────────────────────────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # case-insensitive completion

# ── Key bindings ──────────────────────────────────────────────────────────────
bindkey -e                  # emacs key bindings
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ── Prompt ────────────────────────────────────────────────────────────────────
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}${vcs_info_msg_0_}%f%# '

# ── Aliases ───────────────────────────────────────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias mkdir='mkdir -p'

# ── Environment ───────────────────────────────────────────────────────────────
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export LESS='-R'

[[ -d "$HOME/bin" ]]        && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# ── Local overrides ───────────────────────────────────────────────────────────
# Machine-specific settings that should NOT be committed to the repo
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
