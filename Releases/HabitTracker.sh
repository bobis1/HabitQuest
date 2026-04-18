#!/bin/sh
printf '\033c\033]0;%s\a' HabitTracker
base_path="$(dirname "$(realpath "$0")")"
"$base_path/HabitTracker.x86_64" "$@"
