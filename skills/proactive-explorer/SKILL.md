---
name: proactive-explorer
description: |
  Use this skill to proactively discover resources, tools, and information that the user might need
  but hasn't asked for. Inspired by ProactiveAgent (THUNLP).
  Triggers: before starting complex tasks, when the agent identifies knowledge gaps, when the task
  could benefit from external tools/APIs the user might not know about.
  Keywords: "discover", "find resources", "what else do I need", "有什么工具", "还有什么"
---

# Proactive Explorer Skill

## Overview

This skill implements **Proactive Exploration** from the MCAF framework, inspired by ProactiveAgent (THUNLP, 2024). It shifts the agent from reactive execution ("you asked for X, here's X") to proactive value discovery ("you asked for X, I also found Y and Z").

## When to Activate

- Before starting a **complex task** (always at L3+)
- When the agent identifies **knowledge gaps**
- When the task could benefit from **external tools/APIs** the user might not know about
- When there are **existing project resources** that are relevant but not obvious
- User asks: "what tools are available", "what else should I consider", "check what's available"

## Exploration Protocol

### Step 1: Resource Scan (Quick, 30s)
```
1. Search for relevant files in the project
2. Check available MCP tools
3. Check installed skills and plugins
4. Check recent git history
```

### Step 2: Knowledge Gap Analysis
Based on the task, identify:
1. What do I NOT know that I should?
2. What domain knowledge would improve the output?
3. What recent changes might be relevant?
4. What external resources should be consulted?

### Step 3: Proactive Discovery
Search for:
1. **Existing patterns** in the codebase that apply
2. **Available tools** (MCP servers, CLI tools, skills)
3. **Documentation** that might be relevant
4. **External best practices** via web search (if autonomy >= L2)

### Step 4: Report
```
## Proactive Exploration Report

### Discovered Resources
| Resource | Type | Relevance | Access |
|----------|------|-----------|--------|
| [Name] | tool/file/doc/pattern | High/Med/Low | [How to use] |

### Knowledge Gaps
| Gap | Impact | How to Fill |
|-----|--------|-------------|
| [Gap] | High/Med/Low | [Method] |

### Proactive Suggestions
1. [Suggestion] — Reason: [why valuable]
2. [Suggestion] — Reason: [...]
...

### Risk Warnings
- [Potential issue the user might not be aware of]
```

## Exploration Intensity by Autonomy Level

| Level | Quick Scan | Deep Scan | Web Search | Max Suggestions |
|-------|-----------|-----------|------------|-----------------|
| L0 | No | No | No | 0 |
| L1 | Yes | No | No | 1 |
| L2 | Yes | Partial | If needed | 2-3 |
| L3 | Yes | Yes | Yes | 3-5 |
| L4 | Yes | Yes | Yes | 5 |

## Integration

- Feeds into `goal-space-monitor` for implicit need discovery
- Feeds into `divergence-convergence` for approach generation
- Intensity controlled by `autonomy-regulator`
- All discoveries verified by `anti-hallucination-guard`
