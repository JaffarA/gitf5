#!/usr/bin/env bash

# gitf5: Smart git branch refresh utility
# https://github.com/JaffarA/gitf5
# MIT License

has_branch() {
  git branch | grep -q "$1"
}

get_branch() {
  local primary="$1"
  local fallback="$2"
  if [ -d .git ] && has_branch "$primary"; then
    echo "$primary"
  elif [ -d .git ] && [ -n "$fallback" ] && has_branch "$fallback"; then
    echo "$fallback"
  else
    echo "${3:-}"  # default value if provided
  fi
}

gitf5() {
  local target="$1"
  local current=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  local main=$(get_branch "main" "master" "main")
  local dev=$(get_branch "develop" "dev")
  
  # Refresh branches
  for branch in "$main" "${dev:+$dev}"; do  # dev only if non-empty
    [ -n "$branch" ] && git checkout "$branch" && git fetch origin --prune
  done
  
  # Return to target branch or stay on current
  git checkout "${target:-$current}"
  echo "Refreshed ✅"
}

# If script is sourced, only define the functions
# If script is run directly, execute with arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  gitf5 "$@"
fi
