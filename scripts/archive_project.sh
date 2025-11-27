#!/bin/bash
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi
cd "$HOME/Projects" || exit
ARCHIVE="${PROJECT_NAME}_archive_$(date +%Y%m%d).zip"
zip -r "$ARCHIVE" "$PROJECT_NAME" -x "*.git*"
echo "✅ Archive: $ARCHIVE"
