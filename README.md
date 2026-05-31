# Cognitive Flexibility Plugin for Claude Code

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Framework: MCAF](https://img.shields.io/badge/Framework-MCAF-blue.svg)]()
[![Compatibility: Claude Code](https://img.shields.io/badge/Compatibility-Claude_Code-9B59B6.svg)]()

> Give your AI agent the ability to think beyond the literal request.

Most AI agents suffer from **task rigidity**: they execute what you ask, but never consider what you *actually* need. Ask an agent to "write a project proposal," and it produces a document — without considering audience expectations, formatting standards, risk analysis, stakeholder alignment, or whether a different format would work better.

This plugin implements the **Metacognitive Agent Framework (MCAF)**, a research-backed architecture that gives agents cognitive flexibility through five coordinated components.

---

## How It Works

```
┌──────────────────────────────────────────────────┐
│                 MCAF Plugin                       │
│                                                  │
│  ┌─────────────────┐   ┌──────────────────────┐  │
│  │ Goal Space      │─▶| Divergence-Convergence│  │
│  │ Monitor         │   │ Engine                │  │
│  │ (What to pursue)│   │ (How to explore)      │  │
│  └────────┬────────┘   └──────────┬───────────┘  │
│           │                       │               │
│           ▼                       ▼               │
│  ┌─────────────────┐   ┌──────────────────────┐  │
│  │ Autonomy         │   │ Proactive Explorer    │  │
│  │ Regulator        │   │ (What you don't know) │  │
│  │ (How much initiative)│                      │  │
│  └────────┬────────┘   └──────────┬───────────┘  │
│           │                       │               │
│           └───────────┬───────────┘               │
│                       ▼                           │
│            ┌─────────────────────┐                │
│            │ Anti-Hallucination  │                │
│            │ Guard               │                │
│            │ (Verify everything)  │                │
│            └─────────────────────┘                │
└──────────────────────────────────────────────────┘
```

---

## Components

### Agents (5)

| Agent | Purpose | Model |
|-------|---------|-------|
| `goal-space-monitor` | Discovers implicit goals and expands the goal frame | sonnet |
| `divergence-convergence` | Structured exploration before commitment | opus |
| `autonomy-regulator` | Controls L0-L4 autonomy level | haiku |
| `proactive-explorer` | Proactively discovers resources and knowledge | sonnet |
| `anti-hallucination-guard` | Three-layer verification safeguard | haiku |

### Skills (6)

| Skill | Trigger Keywords |
|-------|-----------------|
| `goal-space-monitor` | "design", "create", "optimize", "设计", "创建" |
| `divergence-convergence` | "brainstorm", "compare", "alternatives", "方案对比" |
| `autonomy-regulator` | "just do it", "直接做", "全面分析" |
| `metacognitive-reflection` | "reflect", "复盘", "反思" |
| `proactive-explorer` | "discover", "find resources", "有什么工具" |
| `anti-hallucination-guard` | "verify", "check", "验证", "确认" |

### Commands (7)

| Command | Description |
|---------|-------------|
| `/cf-analyze` | Analyze goal space before execution |
| `/cf-diverge` | Run divergence-convergence cycle |
| `/cf-reflect` | Trigger metacognitive reflection |
| `/cf-autonomy` | Set/check autonomy level (L0-L4) |
| `/cf-explore` | Proactive resource exploration |
| `/cf-verify` | Anti-hallucination verification |
| `/cf-setup` | Initialize the plugin |

---

## Autonomy Levels

The plugin uses a 5-level autonomy spectrum to control how much initiative the agent takes:

```
L0 ──── L1 ──── L2 ──── L3 ──── L4
Strict   Ask     Suggest  Explore  Discover
```

| Level | Name | When | What Happens |
|-------|------|------|-------------|
| **L0** | Strict Obedience | "just do it" / "直接做" | Execute exactly as asked |
| **L1** | Clarification | Simple ambiguity | Execute + ask about gaps |
| **L2** | Suggestion | Has alternatives | Execute + offer one alternative |
| **L3** | Exploration | Creative/complex task | Explore goal space + options before executing |
| **L4** | Autonomous Discovery | Open-ended strategic | Full research + proposals + radical alternatives |

**Default: L2** — The agent executes your request and offers one better alternative if available.

---

## Installation

### As a Claude Code Plugin

```bash
# From your Claude Code session:
/plugin install /path/to/cognitive-flexibility-plugin
```

### Manual Installation

Copy the plugin files to your project's `.claude/` directory or your global `~/.claude/` directory:

```bash
# Copy agents
cp -r agents/ ~/.claude/agents/

# Copy skills
cp -r skills/ ~/.claude/skills/

# Copy commands
cp -r commands/ ~/.claude/commands/

# Copy rules
cp -r rules/ ~/.claude/rules/

# Run setup
/cf-setup
```

---

## Quick Start

1. **Install the plugin** → `/cf-setup`
2. **Your agent now has cognitive flexibility** — it will:
   - Notice when your request has implicit goals
   - Offer alternatives when better approaches exist
   - Proactively discover resources you might need
   - Reflect on its own thinking when stuck
3. **Control the autonomy level**:
   - Say "just do it" for strict execution (L0)
   - Say "全面分析" for thorough exploration (L3)
   - Use `/cf-autonomy L4` for maximum initiative

---

## Examples

### Before: Rigid Agent

```
User: "Write a project proposal"
Agent: [Produces a generic proposal document]
```

### After: Flexible Agent (L3)

```
User: "Write a project proposal"

Agent: ## Goal Space Analysis

### Stated Goal
Write a project proposal document

### Discovered Implicit Goals
1. Audience alignment — Reason: Different stakeholders need different levels of detail
2. Risk assessment — Reason: Decision-makers need to understand potential downsides
3. Timeline & milestones — Reason: A proposal without a plan isn't actionable
4. Success metrics — Reason: Without clear KPIs, the project can't be evaluated
5. Budget considerations — Reason: Resource planning is critical for approval

### Recommended Autonomy: L3
This is a creative task with multiple implicit subgoals.

### Approach Options
| Approach | Pros | Cons |
|----------|------|------|
| A: Standard doc proposal | Familiar format | May lack visual impact |
| B: Interactive web proposal | Engaging, trackable | More effort to create |
| C: Slide deck + one-pager | Dual format for different audiences | Two deliverables |

Which approach would you prefer? Should I also prepare an executive summary?
```

### More Examples

| User Request | Rigid Response | Flexible Response (L3) |
|-------------|---------------|----------------------|
| "Refactor this module" | Rewrite the code | Analyze dependencies, propose migration strategy, identify risks |
| "Create a REST API" | Generate endpoints | Consider auth, versioning, rate limiting, documentation |
| "Build a landing page" | HTML/CSS output | Research target audience, SEO, accessibility, A/B testing |
| "Optimize this query" | Add indexes | Analyze query patterns, consider caching, data archiving |

---

## Research Foundation

This plugin is based on peer-reviewed research:

| Research | Contribution | Reference |
|----------|-------------|-----------|
| **ProactiveAgent** | First framework for proactive AI agents | THUNLP, 2024 |
| **MUTATE Benchmark** | Systematic evaluation of agent divergent thinking | — |
| **Intelligent Disobedience** | Autonomy levels for agent disobedience | Mirsky et al. |
| **ReflAct** | Goal-state reflection mechanism | EMNLP 2025 |
| **Design Thinking** | Divergence-convergence methodology | Stanford d.school |

---

## Compatibility

This plugin is designed to work alongside other Claude Code plugins and configurations:

- **Agent delegation plugins**: MCAF operates as a meta-layer above specialized agent routing — it ensures the right goals are being pursued before delegation
- **Performance optimization plugins**: Compatible; cognitive flexibility adds value on top of execution efficiency
- **Pattern/workflow plugins**: Complementary; goal flexibility enhances pattern-based workflows

No known conflicts with existing plugin ecosystems.

---

## Configuration

### State Directory

The plugin stores session state in `.cognitive-flex/`:

```
.cognitive-flex/
  autonomy-state.json      # Current autonomy level and task history
  current-session.json     # Active session metadata
```

This directory is automatically added to `.gitignore` during setup.

### Customization

- **Default autonomy level**: Edit `.cognitive-flex/autonomy-state.json` → `user_preferences.default_level`
- **Maximum autonomy**: Set `user_preferences.max_level` (0-4)
- **Language triggers**: Both English and Chinese keywords are supported out of the box

---

## Project Structure

```
cognitive-flexibility-plugin/
├── .claude-plugin/
│   └── plugin.json           # Plugin manifest
├── agents/
│   ├── goal-space-monitor.md
│   ├── divergence-convergence.md
│   ├── autonomy-regulator.md
│   ├── proactive-explorer.md
│   └── anti-hallucination-guard.md
├── skills/
│   ├── goal-space-monitor/
│   ├── divergence-convergence/
│   ├── autonomy-regulator/
│   ├── metacognitive-reflection/
│   ├── proactive-explorer/
│   └── anti-hallucination-guard/
├── commands/
│   ├── cf-analyze.md
│   ├── cf-diverge.md
│   ├── cf-reflect.md
│   ├── cf-autonomy.md
│   ├── cf-explore.md
│   ├── cf-verify.md
│   └── cf-setup.md
├── rules/
│   └── cognitive-flexibility.md
├── hooks/
│   └── hooks.json
├── scripts/
│   ├── session-start.sh
│   ├── session-stop.sh
│   └── pre-tool-check.sh
├── LICENSE
├── CONTRIBUTING.md
├── .gitignore
└── README.md
```

---

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
