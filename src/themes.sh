#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @tokyo-night-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @tokyo-night-tmux_transparent)"

case $SELECTED_THEME in
"storm")
  declare -A THEME=(
    ["background"]="#24283b"
    ["foreground"]="#a9b1d6"
    ["black"]="#414868"
    ["blue"]="#7aa2f7"
    ["cyan"]="#7dcfff"
    ["green"]="#73daca"
    ["magenta"]="#bb9af7"
    ["red"]="#f7768e"
    ["white"]="#a9b1d6"
    ["yellow"]="#e0af68"

    ["bblack"]="#414868"
    ["bblue"]="#7aa2f7"
    ["bcyan"]="#7dcfff"
    ["bgreen"]="#41a6b5"
    ["bmagenta"]="#bb9af7"
    ["bred"]="#f7768e"
    ["bwhite"]="#787c99"
    ["byellow"]="#e0af68"
  )
  ;;

"day")
  declare -A THEME=(
    ["background"]="#d5d6db"
    ["foreground"]="#343b58"
    ["black"]="#0f0f14"
    ["blue"]="#34548a"
    ["cyan"]="#0f4b6e"
    ["green"]="#33635c"
    ["magenta"]="#5a4a78"
    ["red"]="#8c4351"
    ["white"]="#343b58"
    ["yellow"]="#8f5e15"

    ["bblack"]="#9699a3"
    ["bblue"]="#34548a"
    ["bcyan"]="#0f4b6e"
    ["bgreen"]="#33635c"
    ["bmagenta"]="#5a4a78"
    ["bred"]="#8c4351"
    ["bwhite"]="#343b58"
    ["byellow"]="#8f5815"
  )
  ;;

*)
  # Default to night theme
  declare -A THEME=(
    ["background"]="#000000"
    ["foreground"]="#ffffff"
    ["black"]="#1a1a1a"
    ["blue"]="#8a8a8a"
    ["cyan"]="#8a8a8a"
    ["green"]="#8a8a8a"
    ["magenta"]="#8a8a8a"
    ["red"]="#8a8a8a"
    ["white"]="#e0e0e0"
    ["yellow"]="#8a8a8a"

    ["bblack"]="#2a2a2a"
    ["bblue"]="#a0a0a0"
    ["bcyan"]="#a0a0a0"
    ["bgreen"]="#a0a0a0"
    ["bmagenta"]="#a0a0a0"
    ["bred"]="#a0a0a0"
    ["bwhite"]="#f0f0f0"
    ["byellow"]="#a0a0a0"

    # GitHub colors остаются цветными!
    ["ghgreen"]="#3fb950"    # Зелёный
    ["ghmagenta"]="#A371F7"  # Пурпурный
    ["ghred"]="#d73a4a"      # Красный
    ["ghyellow"]="#d29922"   # Жёлтый
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']="#3fb950"
THEME['ghmagenta']="#A371F7"
THEME['ghred']="#d73a4a"
THEME['ghyellow']="#d29922"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
