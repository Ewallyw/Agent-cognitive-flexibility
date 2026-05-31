---
description: "Analyze the goal space of the current task — discover implicit goals, stakeholder needs, and alternative approaches before executing"
argument-hint: "[task description or leave blank to analyze the current task]"
---

# /cf-analyze — Goal Space Analysis

Analyze the goal space of the current task before execution begins. This command activates the **Goal Space Monitor** to discover implicit goals, map boundaries, and suggest the appropriate autonomy level.

## Workflow

### Phase 1: Understand the Task
- If $ARGUMENTS is provided, analyze that task description
- If no arguments, analyze the current conversation context and the last user request

### Phase 2: Goal Space Scan
Using the Goal Space Monitor agent:

1. **Extract explicit goals** — What did the user literally ask for?
2. **Discover implicit goals** — What goals are likely but unstated?
   - Stakeholder needs beyond the requester
   - Downstream effects and integration needs
   - Quality criteria that are assumed but not stated
   - Domain-specific requirements
3. **Map boundaries** — IN scope, UNCERTAIN scope, OUT of scope
4. **Score complexity** — Rate ambiguity, stakeholders, domain expertise, reversibility, novelty (0-2 each)
5. **Recommend autonomy level** — Based on complexity score and risk assessment

### Phase 3: Present Analysis
Show the user:
```
## Goal Space Analysis

### Stated Goal
[literal request]

### Discovered Implicit Goals
1. [goal] — Reason: [why]
2. [goal] — Reason: [why]
...

### Boundaries
- IN: [...]
- UNCERTAIN: [...] (needs your confirmation)
- OUT: [...]

### Recommended Autonomy: L[X]
[justification]

### Approach Options
| Approach | Pros | Cons | Level |
|----------|------|------|-------|
| [A] | ... | ... | L1 |
| [B] | ... | ... | L3 |

### Proactive Suggestions
[things you might not know you need]
```

### Phase 4: Wait for User Decision
Ask the user to:
- Accept the expanded goal frame
- Modify the boundaries
- Choose an approach
- Override the autonomy level
