#!/bin/bash
# Purpose: Import external knowledge (AI summaries, PDFs) into the Knowledge Base.
PROJECT_NAME="$1"; SOURCE="$2"; DESC="$3"

if [ -z "$PROJECT_NAME" ] || [ -z "$SOURCE" ]; then
    echo "❌ Usage: ./import_knowledge.sh <Project> <File> [Description]"
    exit 1
fi

PROJECT_ROOT="$HOME/Projects/$PROJECT_NAME"
DEST_DIR="$PROJECT_ROOT/knowledge_base"

if [ ! -d "$PROJECT_ROOT" ]; then echo "❌ Error: Project not found."; exit 1; fi
if [ ! -f "$SOURCE" ]; then echo "❌ Error: Source file not found."; exit 1; fi

mkdir -p "$DEST_DIR"

# Timestamped naming: note_YYYY-MM-DD_Description.ext
TIMESTAMP=$(date +%Y-%m-%d)
EXT="${SOURCE##*.}"
if [ -n "$DESC" ]; then
    NAME="note_${TIMESTAMP}_${DESC}.${EXT}"
else
    NAME="note_${TIMESTAMP}_imported.${EXT}"
fi

cp "$SOURCE" "$DEST_DIR/$NAME"
echo "✅ Knowledge saved: knowledge_base/$NAME"
