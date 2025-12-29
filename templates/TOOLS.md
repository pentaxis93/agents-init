# Tools & Capabilities

This project has access to the ACFS (Agentic Coding Flywheel Setup) tool suite for multi-agent development.

---

## AI Agents

### Claude Code (`claude`, `cc`)
Primary AI coding agent. Full IDE-level capabilities with file editing, shell access, and tool use.

```bash
claude "implement the feature described in PROJECT.md"
cc "review this file for issues"
```

### Codex CLI (`codex`, `cod`)
OpenAI's coding agent. Alternative perspective, different model.

```bash
codex "refactor this function"
cod "explain this algorithm"
```

### Gemini CLI (`gemini`, `gmi`)
Google's AI agent. Useful for second opinions and specific capabilities.

```bash
gemini "analyze this architecture"
gmi "suggest optimizations"
```

---

## Session Management

### NTM — Named Tmux Manager (`ntm`)
Agent cockpit for managing multiple parallel sessions.

```bash
ntm new myproject          # Create named session
ntm list                   # List sessions
ntm attach myproject       # Attach to session
ntm kill myproject         # Kill session
```

**Use for**: Running multiple agents in parallel, persistent sessions across SSH disconnects.

### SLB — Simultaneous Launch Button (`slb`)
Two-person rule for coordinated agent launches.

```bash
slb launch claude codex    # Launch both agents simultaneously
```

**Use for**: When you need multiple agents working on the same codebase with coordination.

---

## Memory & Search

### CASS — Code Agent Session Search (`cass`)
Unified search across all agent sessions and projects.

```bash
cass search "authentication"     # Search all sessions
cass search --project myapp      # Search specific project
```

**Use for**: Finding how problems were solved before, avoiding re-solving known issues.

### CM — Cass Memory (`cm`)
Learning system that extracts lessons from past sessions.

```bash
cm onboard status          # Check learning status
cm onboard sample          # Get sessions to analyze
cm query "error handling"  # Query learned patterns
```

**Use for**: Building up institutional knowledge, remembering what worked.

---

## Communication

### MCP Agent Mail (`am`, `mcp_agent_mail`)
Inter-agent messaging system. Like email for coding agents.

```bash
am send claude "review complete"   # Send message to agent
am inbox                           # Check messages
am read <id>                       # Read specific message
```

**Use for**: Coordinating multi-agent workflows, async communication between agents.

### CAAM
Coordination and agent asset management.

---

## Utility Tools

### BV
Session and workspace utility.

---

## Tool Selection Guidelines

| Situation | Primary Tool | Fallback |
|-----------|--------------|----------|
| Complex feature development | Claude Code | Codex |
| Code review | Gemini | Claude |
| Parallel workstreams | NTM + multiple agents | Single agent |
| "How did we solve X before?" | CASS search | CM query |
| Coordinating agents | Agent Mail | Direct prompting |

## Permissions

All tools have full file system access within the project directory. Agents can:
- Read/write any project file
- Execute shell commands
- Install dependencies
- Run tests
- Access network for package installation

---

## Adding Tools

To extend this configuration:
1. Install the tool via ACFS or manually
2. Add documentation to this file
3. Update the selection guidelines

---
*ACFS tool suite — UBS excluded per project configuration*
