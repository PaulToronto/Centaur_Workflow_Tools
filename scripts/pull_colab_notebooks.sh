#!/bin/bash
PROJECT_NAME="$1"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi
LOCAL="$HOME/Projects/$PROJECT_NAME/notebooks/"
DRIVE="$HOME/Google Drive/My Drive/Projects/$PROJECT_NAME/notebooks/"
rsync -avh --update "$DRIVE" "$LOCAL"
echo "✅ Notebooks Pulled."
