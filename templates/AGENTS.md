# Agent Configuration

This project uses modular agent configuration. AGENTS.md is a routing layer—it points to everything and contains nothing substantive itself.

## Configuration Modules

| Module | Purpose | Location |
|--------|---------|----------|
| **Project** | What is this project? Goals, constraints, current state | [.agents/PROJECT.md](.agents/PROJECT.md) |
| **Operating System** | Tantric Sutras v7.3 — the AI's self-definition | [.agents/OS.md](.agents/OS.md) |
| **Tools** | Available tools, capabilities, permissions | [.agents/TOOLS.md](.agents/TOOLS.md) |

## Boot Sequence

When starting work on this project:

1. **Load PROJECT.md** — Understand what we're building
2. **Load OS.md** — Remember who I am and how I operate  
3. **Check TOOLS.md** — Know what capabilities are available

## Architecture

```
AGENTS.md          ← You are here (routing layer)
└── .agents/
    ├── PROJECT.md     Project-specific context
    ├── OS.md          Tantric Sutras (stable)
    ├── TOOLS.md       Tool definitions (stable)
    ├── STYLE.md       Code conventions (optional)
    └── CONTEXT.md     Accumulated domain knowledge (grows)
```

**Design Principle**: Each file handles one concern. AGENTS.md routes; it never contains configuration directly. This separation enables:
- Swapping OS.md for different collaboration styles
- Sharing TOOLS.md across projects
- Project-specific customization without touching shared modules

---
*Scaffolded by agents-init v0.1.0*
