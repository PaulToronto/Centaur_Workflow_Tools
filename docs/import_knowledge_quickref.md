# QuickRef — import_knowledge.sh

## Purpose
The primary tool for the "Memory Brain."
Moves files (downloads, chat summaries) into the project `knowledge_base` with a standardized timestamp.

## Usage
```bash
./scripts/import_knowledge.sh <ProjectName> <SourceFile> [Description]
```

## Example
```bash
# You download a summary of "Transformers" from our chat:
./scripts/import_knowledge.sh NLP_Project ~/Downloads/summary.md "transformers_intro"
```

## Result
Saved as: `knowledge_base/note_2025-11-27_transformers_intro.md`
