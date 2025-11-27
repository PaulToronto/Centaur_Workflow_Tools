# QuickRef — sync_to_drive.sh

## Purpose
Back up the project to Google Drive (`Projects/` folder).

## Usage
```bash
./scripts/sync_to_drive.sh <ProjectName>
```

## Behavior
- One-way sync (Local -> Drive).
- Includes: `knowledge_base`, `notebooks`, `outputs`.
- Excludes: `inputs`, `generated_assets` (raw files), `.git`.
