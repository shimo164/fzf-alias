#!/bin/bash

: '
This script provides an interactive command selector using fzf.

It sources commands and their aliases from an external file named "settings.sh"
which declares an associative array `commands` with aliases as keys and their
corresponding commands as values.

This script uses fzf to create an interactive menu of the aliases, which the user can select from.
Upon selecting an alias, the script executes the corresponding command.

Usage:
./fzf_alias_commands.sh

Dependencies:
settings.sh: should be in the same directory as fzf_alias_commands.sh
fzf: https://github.com/junegunn/fzf

'

# Get the directory of the currently executing script
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# File containing commands and aliases
SETTINGS_SH="$DIR/settings.sh"

# Source the settings file
if [ -f "$SETTINGS_SH" ]; then
  source "$SETTINGS_SH"
else
  echo "Settings file $SETTINGS_SH not found!"
  exit 1
fi

# Create a list of aliases for fzf, sorted alphabetically
alias_list=$(printf '%s\n' "${!commands[@]}" | sort)

# Use fzf to select an alias
selected_alias=$(echo "$alias_list" | fzf)

# Get the corresponding command
selected_command="${commands["$selected_alias"]}"

# Run the selected command
if [ -n "$selected_command" ]; then
  echo "Running: $selected_command"
  eval "$selected_command"
else
  echo "Command not found!"
fi
