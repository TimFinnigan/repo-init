#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Get GitHub username dynamically
GITHUB_USER=$(gh api user | jq -r .login)

# Prompt the user for repository visibility
while true; do
  echo "Enter repository visibility (public/private):"
  read VISIBILITY

  if [[ "$VISIBILITY" == "public" || "$VISIBILITY" == "private" ]]; then
    break
  else
    echo "❌ Invalid input! Please enter 'public' or 'private'."
  fi
done

# Prompt for repository name
echo "Enter the repository name:"
read REPO_NAME

# Create the repository with the chosen visibility
gh repo create "$REPO_NAME" --"$VISIBILITY"

# Navigate into the repository (create directory if needed)
mkdir "$REPO_NAME"
cd "$REPO_NAME"

# Initialize Git and manually add the remote
git init
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Create and switch to the main branch before pushing
git checkout -b main

# Create an empty commit to allow pushing branches
git commit --allow-empty -m "Initial commit"

# Push main branch
git push -u origin main

# Create and switch to the 'develop' branch
git checkout -b develop

# Add another empty commit for the develop branch
git commit --allow-empty -m "Initial develop commit"

# Push develop branch
git push --set-upstream origin develop

echo "✅ Repository '$REPO_NAME' created as '$VISIBILITY' and both 'main' and 'develop' branches pushed!"
