#!/usr/bin/env bash
input=$(cat)

# Parse fields from JSON
model=$(echo "$input" | sed -n 's/.*"display_name" *: *"\([^"]*\)".*/\1/p')
used=$(echo "$input" | sed -n 's/.*"used_percentage" *: *\([0-9.]*\).*/\1/p')
cwd=$(echo "$input" | sed -n 's/.*"current_dir" *: *"\([^"]*\)".*/\1/p')

[ -z "$model" ] && model="Unknown"

# Git branch with dirty indicator (checks both unstaged and staged changes)
branch=""
if git_branch=$(git -C "${cwd:-.}" rev-parse --abbrev-ref HEAD 2>/dev/null); then
  dirty=""
  if ! git -C "${cwd:-.}" diff --quiet 2>/dev/null || ! git -C "${cwd:-.}" diff --cached --quiet 2>/dev/null; then
    dirty="*"
  fi
  branch="${git_branch}${dirty}"
fi

# Context window usage percentage
if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  ctx="${used_int}%"
else
  ctx="--%"
fi

# Assemble output: model | branch | ctx (skip branch section if not in a git repo)
if [ -n "$branch" ]; then
  echo "${model} | ${branch} | ${ctx}"
else
  echo "${model} | ${ctx}"
fi
