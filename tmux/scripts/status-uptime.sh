#!/bin/sh
# macOS system uptime, independent of the tmux server lifetime.
boot=$(sysctl -n kern.boottime | awk -F '[ ,]+' '{print $4}')
case "$boot" in ''|*[!0-9]*) exit 0 ;; esac
seconds=$(( $(date +%s) - boot ))
days=$((seconds / 86400))
hours=$((seconds % 86400 / 3600))
minutes=$((seconds % 3600 / 60))
if [ "$days" -gt 0 ]; then
    printf 'up:%dd %dh %dm' "$days" "$hours" "$minutes"
else
    printf 'up:%dh %dm' "$hours" "$minutes"
fi
