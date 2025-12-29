# agents-init

Universal project scaffolding for AI coding agents.

Works with **Claude Code**, **Gemini CLI**, and **Codex CLI**.

## Installation

```bash
git clone https://github.com/pentaxis93/agents-init.git
cd agents-init
./install.sh
```

If `~/.local/bin` isn't in your PATH:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Usage

```bash
agents init my-project     # Create new project
agents build               # Rebuild after editing .agents/*
agents upgrade             # Get latest OS.md and TOOLS.md
agents update              # Update CLI itself
```

## Architecture

**Source files** (edit these):
```
.agents/
├── PROJECT.md     # Your project context
├── OS.md          # AI operating system
└── TOOLS.md       # Tool definitions
```

**Generated files** (don't edit directly):
```
AGENTS.md          # Concatenated output (Codex CLI)
CLAUDE.md          # Symlink → AGENTS.md (Claude Code)
GEMINI.md          # Symlink → AGENTS.md (Gemini CLI)
```

## Workflow

1. `agents init my-project`
2. Edit `.agents/PROJECT.md` with your project details
3. `agents build`
4. All three CLIs see identical configuration

## Commands

| Command | Purpose |
|---------|---------|
| `init [name]` | Create new project with agent configuration |
| `build` | Regenerate AGENTS.md from .agents/* sources |
| `upgrade` | Update OS.md and TOOLS.md templates, rebuild |
| `update` | Update the agents CLI itself |
| `list` | Show available modules |

## Uninstall

```bash
./install.sh --uninstall
```
