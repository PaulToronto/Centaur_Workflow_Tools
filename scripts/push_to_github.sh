#!/bin/bash
# Purpose: Push to GitHub, creating the repo/remote if missing.
PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Error: Project Name required."
    exit 1
fi

PROJECT_ROOT="$HOME/Projects/$PROJECT_NAME"

if [ ! -d "$PROJECT_ROOT" ]; then
    echo "❌ Error: Project directory not found."
    exit 1
fi

cd "$PROJECT_ROOT" || exit

# 1. Check for Commits
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
    echo "❌ Error: No commits found."
    echo "   Running 'commit_local.sh' for you..."
    "$HOME/Projects/Centaur_Workflow_Tools/scripts/commit_local.sh" "$PROJECT_NAME" "Initial Commit"
fi

# 2. Check for Remote
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "⚠️  No remote 'origin' found."
    
    # Check if GitHub CLI is installed
    if command -v gh >/dev/null 2>&1; then
        echo "🛠  GitHub CLI (gh) detected."
        read -p "Do you want to create '$PROJECT_NAME' on GitHub now? (y/n) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            # Create private repo and push
            gh repo create "$PROJECT_NAME" --private --source=. --remote=origin --push
            echo "✅ Repo created and pushed!"
            exit 0
        fi
    else
        echo "ℹ️  GitHub CLI not found."
    fi

    # Fallback: Manual URL entry
    echo "Please create a repository on GitHub.com and paste the URL here."
    read -p "Repo URL: " REMOTE_URL
    
    if [ -n "$REMOTE_URL" ]; then
        git remote add origin "$REMOTE_URL"
        echo "✅ Remote added."
    else
        echo "❌ No URL provided. Aborting."
        exit 1
    fi
fi

# 3. Push
echo "🚀 Pushing changes..."
BRANCH=$(git rev-parse --abbrev-ref HEAD)
git push -u origin "$BRANCH"

echo "✅ Success."
