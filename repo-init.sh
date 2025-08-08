#!/bin/bash

# Ensure the script exits if any command fails
set -e

# Get GitHub username dynamically
GITHUB_USER=$(gh api user | jq -r .login)

# Set repository visibility to private (default)
VISIBILITY="private"

# Prompt for repository name
echo -n "Enter the repository name: "
read REPO_NAME

# Create the repository as private
gh repo create "$REPO_NAME" --private

# Create Documents/GitHub directory if it doesn't exist
GITHUB_DIR="$HOME/Documents/GitHub"
mkdir -p "$GITHUB_DIR"

# Navigate to the GitHub directory
cd "$GITHUB_DIR"

# Clone the repository
git clone "https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Navigate into the cloned repository
cd "$REPO_NAME"

# Create an initial commit on main branch
git commit --allow-empty -m "Initial commit"
git push -u origin main

# Create and switch to the 'develop' branch
git checkout -b develop

# Add an empty commit for the develop branch
git commit --allow-empty -m "Initial develop commit"

# Push develop branch
git push --set-upstream origin develop

echo "✅ Repository '$REPO_NAME' created as '$VISIBILITY' and both 'main' and 'develop' branches pushed!"
echo "📁 Repository cloned to: $GITHUB_DIR/$REPO_NAME"

# Open the repository in Cursor (staying on develop branch)
echo "🚀 Opening repository in Cursor..."
cursor "$GITHUB_DIR/$REPO_NAME"

echo ""
echo "✨ Repository setup complete! Cursor should now be open with your new repository."
echo ""

# Countdown timer with abort option
echo ""
echo "🎉 All done! Your repository is ready and open in Cursor."
echo ""
echo "Closing terminal in 5 seconds... (Press Ctrl+C to abort)"

# Simple countdown with sleep - user can press Ctrl+C to abort
for i in 5 4 3 2 1; do
    echo -n "$i... "
    sleep 1
done

echo ""
echo "Goodbye! 👋"

# Close the terminal window without warning by running AppleScript in background and exiting
nohup sh -c 'sleep 0.5; osascript -e "tell application \"Terminal\" to close (every window whose name contains \"repo-init\")" 2>/dev/null' >/dev/null 2>&1 &

# Exit the script cleanly
exit 0
