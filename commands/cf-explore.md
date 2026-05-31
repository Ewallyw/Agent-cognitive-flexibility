---
description: "Proactively explore resources, tools, and knowledge that might be relevant to the current task"
argument-hint: "[domain or topic to explore, or leave blank for current task context]"
---

# /cf-explore — Proactive Exploration

Proactively discover resources, tools, and information relevant to the current task. Inspired by ProactiveAgent (THUNLP).

## Workflow

### Phase 1: Quick Resource Scan
Scan the project for relevant resources:

1. **Files**: Search for related documents, configs, and code
   ```
   Glob for relevant patterns
   Grep for related keywords
   ```

2. **Tools**: Check what's available
   - MCP servers currently configured
   - Installed skills and plugins
   - Available CLI tools

3. **History**: Check recent context
   - Recent git commits
   - Existing TODOs and comments
   - Previous session context

### Phase 2: Knowledge Gap Analysis
Based on the task and scan results, identify:

1. What do we NOT know that we should?
2. What domain knowledge would improve the output?
3. What external resources should we consult?

### Phase 3: Deep Exploration (if autonomy >= L2)
If the autonomy level supports it:
- WebSearch for best practices and authoritative sources
- Check for relevant libraries and APIs
- Look for similar problems and their solutions
- Identify integration opportunities

### Phase 4: Report
```
## Proactive Exploration Report

### Discovered Resources
| Resource | Type | Relevance | How to Access |
|----------|------|-----------|---------------|
| [Name] | tool/file/doc/pattern | High/Med/Low | [method] |

### Knowledge Gaps
| Gap | Impact | How to Fill |
|-----|--------|-------------|
| [Gap] | High/Med/Low | [method] |

### Proactive Suggestions
1. [Suggestion] — Why: [reason]
2. [Suggestion] — Why: [reason]
3. [Suggestion] — Why: [reason]

### Risk Warnings
- [Potential issue]
```

### Phase 5: Integration
Based on findings:
- If significant implicit goals found → suggest `/cf-analyze`
- If multiple approaches possible → suggest `/cf-diverge`
- If knowledge gaps are critical → fill them before proceeding
