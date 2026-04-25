#!/usr/bin/env bash
# install.sh — symlink dotfiles into $HOME
# Usage: bash install.sh

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Files to symlink: key = file in this repo, value = target in $HOME
declare -A FILES=(
  [bashrc]=.bashrc
  [zshrc]=.zshrc
  [gitconfig]=.gitconfig
  [vimrc]=.vimrc
  [tmux.conf]=.tmux.conf
  [claude/commands/debrief.md]=.claude/commands/debrief.md
)

info()    { echo "[info]  $*"; }
success() { echo "[ok]    $*"; }
warn()    { echo "[warn]  $*"; }

backup_and_link() {
  local src="$1"   # full path inside this repo
  local dst="$2"   # full path in $HOME

  if [[ ! -f "$src" ]]; then
    warn "Source not found, skipping: $src"
    return
  fi

  # Back up an existing file/symlink that is not already pointing here
  if [[ -e "$dst" || -L "$dst" ]]; then
    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
      success "Already linked: $dst"
      return
    fi
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/"
    warn "Backed up existing $dst → $BACKUP_DIR/"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  success "Linked: $dst → $src"
}

main() {
  info "Dotfiles directory : $DOTFILES_DIR"
  info "Home directory     : $HOME"
  echo

  for repo_file in "${!FILES[@]}"; do
    backup_and_link "$DOTFILES_DIR/$repo_file" "$HOME/${FILES[$repo_file]}"
  done

  echo
  success "Done! Restart your shell or source the relevant files to apply changes."
}

main "$@"
