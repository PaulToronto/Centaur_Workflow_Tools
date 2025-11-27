# Centaur Workflow Tools (V2)

**"Half Human, Half AI, Fully Organized."**

This repository contains the system architecture for managing hybrid Human-AI data science and learning projects. It is designed to solve the problem of **context loss** and **disorganized knowledge** when working with LLMs (like Gemini, ChatGPT, Claude).

---

## 🧠 The Philosophy: "Knowledge-First"

In V2, we separate **Execution** (Code) from **Memory** (Concepts).

1.  **The Execution Brain** (`notebooks/`, `scripts/`)
    *   Where code runs, data is processed, and models are trained.
    *   Transient, iterative, and heavily version-controlled.
2.  **The Memory Brain** (`knowledge_base/`)
    *   Where *concepts* are stored.
    *   Includes: AI chat summaries, design docs, PDF cheat sheets.
    *   *Goal:* If you switch AI models, your knowledge base remains independent and persistent.

---

## 📁 Repository Structure

```text
Centaur_Workflow_Tools/
├── scripts/       # The 13 executable Bash tools (The Controller)
└── docs/          # Detailed Quick-Reference guides for each tool
```

---

## ⚙️ How It Works (Controller Architecture)

These scripts are designed to be run from **this directory**, targeting external projects located in `~/Projects/`.

**The Standard Command Pattern:**
```bash
./scripts/<tool_name>.sh <ProjectName> [Arguments]
```

### 1. Lifecycle Management
| Script | Purpose |
| :--- | :--- |
| `create_centaur_project.sh` | **Start Here.** Creates the V2 folder structure (Local + Drive) and a project README. |
| `verify_workflow.sh` | Checks health (missing folders, uncommitted changes, Drive connection). |
| `check_quickrefs.sh` | Verifies this toolbox itself is intact and has all documentation. |

### 2. Knowledge Management (The "Memory")
| Script | Purpose |
| :--- | :--- |
| `import_knowledge.sh` | Imports a file (e.g., Downloaded Chat, PDF) into `knowledge_base/` with a timestamp. |

### 3. Synchronization (The "Cloud")
| Script | Purpose |
| :--- | :--- |
| `sync_to_drive.sh` | One-way backup: Local → `~/Google Drive/My Drive/Projects/`. |
| `pull_colab_notebooks.sh` | Pulls notebooks *from* Drive (Colab) → Local. |
| `push_colab_notebooks.sh` | Pushes notebooks *to* Drive (Colab) ← Local. |

### 4. Operations & Git
| Script | Purpose |
| :--- | :--- |
| `commit_local.sh` | Quick git add + commit with timestamp logging. |
| `push_to_github.sh` | Pushes current branch to origin. |
| `archive_project.sh` | Zips the entire project for long-term storage (excludes `.git`). |

### 5. Integrations & Monitoring
| Script | Purpose |
| :--- | :--- |
| `enable_kaggle_for_project.sh`| Sets up API keys and downloads competition data to `inputs/`. |
| `watch_workflow.sh` | Live monitor for file changes (useful during deep work sessions). |
| `add_nb_links.sh` | Generates a Markdown index of all project notebooks. |

---

## 🚀 Getting Started

1.  **Create your first project:**
    ```bash
    ./scripts/create_centaur_project.sh MyFirstProject
    ```
2.  **Learn something new & save it:**
    *   *Chat with Gemini about a topic.*
    *   *Download the summary as `summary.md`.*
    *   *Import it:*
    ```bash
    ./scripts/import_knowledge.sh MyFirstProject ~/Downloads/summary.md "Topic_Summary"
    ```
3.  **Start Coding:**
    *   Open `~/Projects/MyFirstProject/notebooks/`.
    *   Launch Jupyter Lab or VS Code.

---

## 📚 Documentation
For detailed behavior of specific tools, look in the `docs/` folder.
