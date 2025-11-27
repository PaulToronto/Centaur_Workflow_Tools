#!/bin/bash
PROJECT_NAME="$1"; COMP="$2"
if [ -z "$PROJECT_NAME" ]; then echo "❌ Error: Project Name required."; exit 1; fi
ROOT="$HOME/Projects/$PROJECT_NAME"
if [ ! -f "$HOME/.kaggle/kaggle.json" ]; then echo "❌ Kaggle API key missing."; exit 1; fi
chmod 600 "$HOME/.kaggle/kaggle.json"
echo "✅ Kaggle API active."
if [ -n "$COMP" ]; then
    mkdir -p "$ROOT/inputs" && cd "$ROOT/inputs" || exit
    kaggle competitions download -c "$COMP"
    echo "✅ Data downloaded."
fi
