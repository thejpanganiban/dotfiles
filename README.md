# Dotfiles

## Tmux setup

Requires tmux 3.2+ (3.6+ recommended), fzf, and Git. On macOS:

```sh
brew install tmux fzf
 git clone https://github.com/thejpanganiban/dotfiles.git ~/Dotfiles
cd ~/Dotfiles
sh setup.sh
```

Setup links the tmux config and helper scripts, backs up existing files before replacing them, and installs TPM if needed. Existing Vim and shell configurations are not changed.

Reload an existing tmux with **Ctrl-b r**, then **Ctrl-b I** to install plugins.

- **Ctrl-b k**: fuzzy-search sessions and their tabs (windows) in a popup; Enter switches directly to the selected tab, Esc cancels.
- **Up/Down** or **Ctrl-j/k**: navigate the picker.
- **Ctrl-b Up**: move to the pane above.
- **Ctrl-b Enter**: toggle the `system` session and the previous session (requires a session named `system`).
- tmux-resurrect and tmux-continuum save layouts every five minutes and restore on server startup.

`tmux.conf` is the canonical configuration; `.tmux.conf` points to it. Helpers live in `tmux/scripts/`. The existing `.vim/` and `.profile` files are retained; `vimrc` captures the local minimal Vim plugin configuration.
