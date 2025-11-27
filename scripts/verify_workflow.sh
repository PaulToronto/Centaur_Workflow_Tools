#!/bin/bash
# Purpose: Verify Centaur V2 Structure.
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi

PROJECT_ROOT="$HOME/Projects/$PROJECT_NAME"
DRIVE_ROOT="$HOME/Google Drive/My Drive/Projects/$PROJECT_NAME"

if [ ! -d "$PROJECT_ROOT" ]; then echo "❌ Error: Project not found."; exit 1; fi
echo "🔍 Verifying $PROJECT_NAME..."

# Check V2 Folders
REQUIRED=("inputs" "notebooks" "knowledge_base" "reflection")
MISSING=0
for dir in "${REQUIRED[@]}"; do
    if [ ! -d "$PROJECT_ROOT/$dir" ]; then echo "❌ Missing: $dir"; ((MISSING++)); fi
done

if [ ! -d "$DRIVE_ROOT" ]; then echo "⚠️  Drive mirror not found."; else echo "✅ Drive mirror active."; fi
if [ -n "$(git -C "$PROJECT_ROOT" status --porcelain 2>/dev/null)" ]; then echo "⚠️  Uncommitted changes."; else echo "✅ Git clean."; fi

if [ $MISSING -eq 0 ]; then echo "✅ Structure Healthy."; else exit 1; fi
