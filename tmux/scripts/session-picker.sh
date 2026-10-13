#!/bin/sh
# Receive the originating client explicitly so only that client switches.
client=$1
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
selection=$(tmux list-sessions -F '#{session_id}	#{session_name}	#{session_windows} windows#{?session_attached, · attached,}' |
    FZF_DEFAULT_OPTS= fzf --delimiter='\t' --with-nth=2.. --layout=reverse \
        --border=rounded --prompt='Session > ' \
        --header='Enter: switch · ↑/↓ or Ctrl-j/k: navigate · Esc: cancel' \
        --bind='ctrl-j:down,ctrl-k:up' --no-multi) || exit 0
[ -n "$selection" ] || exit 0
session_id=${selection%%"$(printf '\t')"*}
tmux switch-client -c "$client" -t "$session_id"
