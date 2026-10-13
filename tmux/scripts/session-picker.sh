#!/bin/sh
# Receive the originating client explicitly so only that client switches.
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
client=${1:-}
# Tolerate the old binding only when there is exactly one attached client.
case "$client" in *'#{'*) client= ;; esac
clients=$(tmux list-clients -F '#{client_name}') || exit 1
if [ -z "$client" ]; then
    case "$clients" in
        ''|*'
'*) printf '%s\n' 'Cannot determine the originating tmux client.' >&2; exit 1 ;;
        *) client=$clients ;;
    esac
fi
found=false
while IFS= read -r candidate; do
    [ "$candidate" != "$client" ] || found=true
done <<EOF
$clients
EOF
if [ "$found" != true ]; then
    printf 'Originating tmux client is no longer attached: %s\n' "$client" >&2
    exit 1
fi
log="$HOME/.tmux/session-picker.log"
selection=$(tmux list-windows -a -F '#{session_id}:#{window_id}	#{session_name} / #{window_index}: #{window_name}#{?window_active, · active,}' |
    FZF_DEFAULT_OPTS= fzf --delimiter='\t' --with-nth=2.. --layout=reverse \
        --border=rounded --prompt='Session / tab > ' \
        --header='Enter: switch · ↑/↓ or Ctrl-j/k: navigate · Esc: cancel' \
        --bind='ctrl-j:down,ctrl-k:up' --no-multi) || exit 0
[ -n "$selection" ] || exit 0
target=${selection%%"$(printf '\t')"*}
# A session:window target switches both in one command.
session_id=${target%%:*}
{
    printf 'client=<%s> selection=<%s> target=<%s> session=<%s>\n' "$client" "$selection" "$target" "$session_id"
    tmux switch-client -c "$client" -t "$target"
} >"$log" 2>&1
status=$?
if [ "$status" -ne 0 ]; then
    printf '\nCould not switch (exit %s):\n' "$status"
    while IFS= read -r line; do printf '%s\n' "$line"; done <"$log"
    printf '\nPress Enter to close.'
    read -r answer
fi
exit "$status"
