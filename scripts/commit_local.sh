#!/bin/bash
PROJECT_NAME="$1"; MESSAGE="$2"
if [ -z "$PROJECT_NAME" ] || [ -z "$MESSAGE" ]; then echo "❌ Usage: ./commit_local.sh <Project> <Message>"; exit 1; fi
PROJECT_ROOT="$HOME/Projects/$PROJECT_NAME"
cd "$PROJECT_ROOT" || exit
git add .
git commit -m "$MESSAGE"
echo "✅ Local commit created."
