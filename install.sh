#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME"
MODULES=(zsh vim screen ssh git fish mise)

usage() {
  cat <<EOF
Usage: $(basename "$0") [options] [module...]

Options:
  -u, --update    Restow (update symlinks) instead of stow
  -d, --delete    Remove symlinks for given modules
  -h, --help      Show this help

Examples:
  $(basename "$0")              # stow all modules
  $(basename "$0") zsh vim      # stow specific modules
  $(basename "$0") -u           # restow all modules
  $(basename "$0") -u zsh       # restow zsh module
  $(basename "$0") -d ssh       # remove ssh symlinks

Available modules: ${MODULES[*]}
EOF
}

check_stow() {
  if ! command -v stow &>/dev/null; then
    echo "Error: GNU stow is not installed."
    echo "  macOS:  brew install stow"
    echo "  Debian: apt install stow"
    exit 1
  fi
}

run_stow() {
  local action="$1"
  local module="$2"
  local module_path="$DOTFILES_DIR/$module"

  if [[ ! -d "$module_path" ]]; then
    echo "  [skip] '$module' — directory not found"
    return 1
  fi

  case "$action" in
    stow)   stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" "$module" ;;
    restow) stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" -R "$module" ;;
    delete) stow --dir="$DOTFILES_DIR" --target="$TARGET_DIR" -D "$module" ;;
  esac
}

main() {
  local action="stow"
  local selected_modules=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -u|--update) action="restow"; shift ;;
      -d|--delete) action="delete"; shift ;;
      -h|--help)   usage; exit 0 ;;
      -*)          echo "Unknown option: $1"; usage; exit 1 ;;
      *)           selected_modules+=("$1"); shift ;;
    esac
  done

  [[ ${#selected_modules[@]} -eq 0 ]] && selected_modules=("${MODULES[@]}")

  check_stow

  echo "Dotfiles: $DOTFILES_DIR → $TARGET_DIR"
  echo "Action:   $action"
  echo "Modules:  ${selected_modules[*]}"
  echo ""

  for module in "${selected_modules[@]}"; do
    if run_stow "$action" "$module" 2>&1; then
      echo "  [ok] $module"
    else
      echo "  [fail] $module"
    fi
  done
}

main "$@"
