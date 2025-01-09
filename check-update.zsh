#!/usr/bin/env zsh

# Get the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Fetch the latest changes from the remote repository
git fetch -q

# Check if the local branch is behind the remote branch
if [ "$(git rev-list --count ${current_branch}..origin/${current_branch})" -gt 0 ]; then
    echo "A new version of your dotfiles has been pushed. Please update"
fi
