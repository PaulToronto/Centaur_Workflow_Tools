#!/bin/bash
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi
ROOT="$HOME/Projects/$PROJECT_NAME"
echo "👀 Watching $PROJECT_NAME..."
if command -v fswatch >/dev/null 2>&1; then
    fswatch -o "$ROOT" --exclude "/\." --exclude "/.git/" | while read num; do echo "[$(date +%T)] Change."; done
else
    LAST=$(date +%s)
    while true; do
        sleep 5
        if [ -n "$(find "$ROOT" -type f -newermt "@$LAST" -not -path "*/.*")" ]; then echo "[$(date +%T)] Change."; fi
        LAST=$(date +%s)
    done
fi
