#!/bin/bash
# Checks if the Toolbox itself is healthy
DOCS="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../docs"
REQUIRED=("create_centaur_project_quickref.md" "import_knowledge_quickref.md" "sync_to_drive_quickref.md" "notebook_sync_quickref.md")
MISSING=0
for d in "${REQUIRED[@]}"; do
    if [ ! -f "$DOCS/$d" ]; then echo "❌ Missing: $d"; ((MISSING++)); fi
done
if [ $MISSING -eq 0 ]; then echo "✅ Toolbox Docs OK."; else exit 1; fi
