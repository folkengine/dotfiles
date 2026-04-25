# dotfiles

Personal dot files shared across machines.

## What's included

| File | Symlinked to | Description |
|------|-------------|-------------|
| `bashrc` | `~/.bashrc` | Bash shell configuration |
| `zshrc` | `~/.zshrc` | Zsh shell configuration |
| `gitconfig` | `~/.gitconfig` | Global Git configuration |
| `vimrc` | `~/.vimrc` | Vim editor configuration |
| `tmux.conf` | `~/.tmux.conf` | Tmux terminal multiplexer config |

## Installation

Clone the repo and run the install script:

```bash
git clone https://github.com/folkengine/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

The script will:
- Create symlinks from your home directory to each file in this repo
- Back up any existing files to `~/.dotfiles_backup/<timestamp>/` before replacing them
- Skip files that are already correctly symlinked

## Machine-specific overrides

Settings that should **not** be committed (e.g. work email, local paths) go in
override files that are sourced automatically but never tracked by this repo:

| Override file | Loaded by |
|--------------|-----------|
| `~/.bashrc.local` | `bashrc` |
| `~/.zshrc.local` | `zshrc` |
| `~/.gitconfig.local` | `gitconfig` |
| `~/.vimrc.local` | `vimrc` |

Example `~/.gitconfig.local`:

```ini
[user]
    name  = Your Name
    email = you@example.com
```

## Adding new dotfiles

1. Add the file to this repo (without the leading dot, e.g. `inputrc`).
2. Add an entry to the `FILES` map in `install.sh`:
   ```bash
   [inputrc]=.inputrc
   ```
3. Re-run `bash install.sh`.
