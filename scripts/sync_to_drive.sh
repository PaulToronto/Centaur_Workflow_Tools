#!/bin/bash
# Purpose: Sync Local -> Drive (Projects folder).
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi
LOCAL_ROOT="$HOME/Projects/$PROJECT_NAME/"
DRIVE_ROOT="$HOME/Google Drive/My Drive/Projects/$PROJECT_NAME/"

if [ ! -d "$LOCAL_ROOT" ]; then echo "❌ Error: Local project not found."; exit 1; fi
mkdir -p "$DRIVE_ROOT"
echo "🔄 Syncing to Drive..."
# Syncing Knowledge Base and Notebooks is priority
rsync -avh --exclude=".*" --exclude="inputs" --exclude="generated_assets" "$LOCAL_ROOT" "$DRIVE_ROOT"
echo "✅ Sync complete."
