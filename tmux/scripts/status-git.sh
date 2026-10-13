#!/bin/sh
# Display the active pane's branch, or commit when HEAD is detached.
branch=$(git -C "$1" symbolic-ref --quiet --short HEAD 2>/dev/null) ||
    branch=$(git -C "$1" rev-parse --short HEAD 2>/dev/null) || exit 0
# Escape tmux format markers in branch names.
printf 'git:%s · ' "$branch" | sed 's/#/##/g'
