#!/bin/sh
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
link() {
    source=$1 target=$2
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        return
    fi
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "$target.backup.$(date +%Y%m%d%H%M%S).$$"
    fi
    ln -s "$source" "$target"
}
command -v tmux >/dev/null || { echo 'Install tmux first (brew install tmux fzf).'; exit 1; }
command -v fzf >/dev/null || { echo 'Install fzf first (brew install fzf).'; exit 1; }
mkdir -p "$HOME/.tmux/scripts" "$HOME/.tmux/plugins"
link "$root/tmux.conf" "$HOME/.tmux.conf"
for script in "$root"/tmux/scripts/*.sh; do
    link "$script" "$HOME/.tmux/scripts/$(basename "$script")"
done
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
echo 'Tmux configured. Reload with prefix + r; install plugins with prefix + I.'
