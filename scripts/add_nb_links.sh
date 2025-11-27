#!/bin/bash
# Purpose: Generate an index of notebooks with nbviewer links (if Git remote exists).
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi

PROJECT_ROOT="$HOME/Projects/$PROJECT_NAME"
INDEX_FILE="$PROJECT_ROOT/notebook_index.md"
NB_DIR="$PROJECT_ROOT/notebooks"

if [ ! -d "$PROJECT_ROOT" ]; then echo "❌ Error: Project not found."; exit 1; fi

echo "# Notebook Index" > "$INDEX_FILE"
echo "*Generated on $(date)*" >> "$INDEX_FILE"
echo "" >> "$INDEX_FILE"

# 1. Try to get GitHub Remote info
cd "$PROJECT_ROOT" || exit
REMOTE_URL=$(git config --get remote.origin.url)
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")

# Clean up SSH or HTTPS URL to get "User/Repo"
# Turns "git@github.com:User/Repo.git" or "https://github.com/User/Repo.git" into "User/Repo"
REPO_SLUG=""
if [ -n "$REMOTE_URL" ]; then
    REPO_SLUG=$(echo "$REMOTE_URL" | sed -E 's/.*github.com[:/](.*)(\.git)?/\1/' | sed 's/\.git$//')
fi

if [ -n "$REPO_SLUG" ]; then
    echo "🔗 GitHub Remote detected: $REPO_SLUG"
    echo "| Notebook | Links |" >> "$INDEX_FILE"
    echo "| :--- | :--- |" >> "$INDEX_FILE"
else
    echo "⚠️  No GitHub remote found. Generating local links only."
fi

# 2. Loop through notebooks
find "$NB_DIR" -name "*.ipynb" | while read nb; do
    FILENAME=$(basename "$nb")
    
    if [ -n "$REPO_SLUG" ]; then
        # Construct nbviewer URL
        # Format: https://nbviewer.org/github/USER/REPO/blob/BRANCH/notebooks/FILENAME
        NB_URL="https://nbviewer.org/github/$REPO_SLUG/blob/$BRANCH/notebooks/$FILENAME"
        GITHUB_URL="https://github.com/$REPO_SLUG/blob/$BRANCH/notebooks/$FILENAME"
        
        echo "| **$FILENAME** | [👀 View in nbviewer]($NB_URL) • [📂 GitHub]($GITHUB_URL) |" >> "$INDEX_FILE"
    else
        # Local Link fallback
        echo "- [$FILENAME](notebooks/$FILENAME)" >> "$INDEX_FILE"
    fi
done

echo "✅ Index generated at $INDEX_FILE"
