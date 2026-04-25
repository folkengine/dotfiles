# ~/.bashrc — bash interactive shell configuration
# Sourced for every new interactive bash session.

# ── History ──────────────────────────────────────────────────────────────────
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth   # ignore duplicates and lines starting with a space
shopt -s histappend      # append to the history file, don't overwrite it

# ── Shell options ─────────────────────────────────────────────────────────────
shopt -s checkwinsize    # update LINES and COLUMNS after each command
shopt -s globstar        # enable ** glob patterns

# ── Prompt ────────────────────────────────────────────────────────────────────
# Shows: user@host:dir (git branch) $
_git_branch() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) && echo " ($branch)"
}

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(_git_branch)\[\033[00m\]\$ '

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

# Add ~/bin and ~/.local/bin to PATH if they exist
[[ -d "$HOME/bin" ]]        && export PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

# ── Local overrides ───────────────────────────────────────────────────────────
# Machine-specific settings that should NOT be committed to the repo
[[ -f "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"
