# agents-init

Project scaffolding CLI for multi-agent development environments.

## Philosophy

AGENTS.md becomes a **thin routing layer** — it points to everything and contains nothing substantive. Configuration is composable through modular files in `.agents/`:

```
project-root/
├── AGENTS.md          # Router (entry point)
└── .agents/
    ├── PROJECT.md     # What is this project?
    ├── OS.md          # Tantric Sutras (AI operating system)
    ├── TOOLS.md       # Available tools and capabilities
    ├── STYLE.md       # Code conventions (optional)
    └── CONTEXT.md     # Domain knowledge (grows over time)
```

**User owns WHAT. Tool owns HOW.**

## Installation

```bash
./install.sh
```

This installs to `~/.local/share/agents-init` and creates a symlink at `~/.local/bin/agents`.

If `~/.local/bin` isn't in your PATH, add it:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

```bash
# Scaffold current directory
agents init

# Create new project directory
agents init my-project

# Interactive mode
agents init -i

# List available modules
agents list

# Help
agents help
```

## What Gets Created

| File | Purpose |
|------|---------|
| `AGENTS.md` | Routing layer — points to .agents/* |
| `.agents/PROJECT.md` | Placeholder for project context |
| `.agents/OS.md` | Tantric Sutras v7.3 — AI self-definition |
| `.agents/TOOLS.md` | ACFS tool documentation |

## Customization

- **Different OS**: Replace `.agents/OS.md` with alternative AI operating system
- **Different tools**: Edit `.agents/TOOLS.md` for your environment
- **Add modules**: Create additional `.md` files in `.agents/` and reference from `AGENTS.md`

## Uninstall

```bash
./install.sh --uninstall
```

---

*Part of the Recursive Loop development ecosystem*
