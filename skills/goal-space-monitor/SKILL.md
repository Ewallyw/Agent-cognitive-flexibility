---
name: goal-space-monitor
description: |
  Use this skill when a new task arrives and needs goal space analysis before execution.
  Triggers: user request involves creative/design/strategic work, task seems underspecified,
  the word "design", "create", "optimize", "improve" appears, or the agent has been executing
  linearly for 5+ steps without reflecting on alternative approaches.
  Keywords: "goal", "scope", "what do I actually need", "requirements", "implicit goals",
  "设计", "创建", "优化", "改进"
---

# Goal Space Monitor Skill

## Overview

This skill implements the **Goal Space Monitor** component of the Metacognitive Agent Framework (MCAF). It ensures that the agent never operates within an artificially narrow goal frame by surfacing implicit goals, stakeholder needs, and better alternatives before execution begins.

## When to Activate

- User request involves **creative/design/strategic** work
- Task seems **underspecified** or has multiple interpretations
- The agent has been executing **linearly for 5+ steps** without reflection
- User says: "design", "create", "optimize", "improve", "architect", "build" without specifics
- The task intersects with domains the user might not be expert in
- **ProactiveAgent pattern**: The agent could add value by discovering what the user doesn't know they need

## Activation Keywords

| Keyword | Autonomy Level |
|---------|---------------|
| "design" / "设计" | L3 |
| "optimize" / "优化" | L2 |
| "create" / "创建" | L3 |
| "improve" / "改进" | L2 |
| "analyze" / "帮我分析" | L3 |
| "not sure" / "不确定" | L3 |
| "any suggestions" / "有什么建议" | L2 |

## Process

### Step 1: Explicit Goal Extraction
Parse the user's literal request and extract:
- What they explicitly asked for
- What format/output they expect
- What constraints they mentioned
- What timeline they implied

### Step 2: Implicit Goal Discovery
For each explicit goal, ask:
1. **Stakeholder analysis**: Who else is affected? What do they need?
2. **Downstream effects**: What happens after this task is "done"?
3. **Quality criteria**: What "good" looks like (that isn't stated)?
4. **Domain requirements**: What domain-specific needs exist?
5. **Integration needs**: How does this fit with existing systems/work?

### Step 3: Goal Boundary Mapping
- **IN scope**: What is definitely included
- **UNCERTAIN scope**: What might be included (needs user confirmation)
- **OUT of scope**: What is definitely excluded

### Step 4: Autonomy Level Recommendation
Based on the task's complexity score:
- Simple/mechanical → L0 or L1
- Has alternatives → L2
- Creative/strategic → L3
- Open-ended/exploratory → L4

### Step 5: Present Goal Expansion Report
Show the user the expanded goal frame and get confirmation before proceeding.

## Output Template

```
## Goal Space Analysis

### Stated Goal
[User's literal request]

### Discovered Implicit Goals
1. [Goal] — Reason: [why this is likely needed]
2. [Goal] — Reason: [...]
...

### Goal Space Boundaries
- IN: [...]
- UNCERTAIN: [...]
- OUT: [...]

### Recommended Autonomy: L[X]
[Justification]

### Approach Comparison
| Approach | Pros | Cons | Autonomy |
|----------|------|------|----------|
| [A] | ... | ... | L1 |
| [B] | ... | ... | L3 |

### Proactive Suggestions
[Things the user might not know they need]
```

## Integration

- After analysis, route to `divergence-convergence` skill for structured exploration
- Use `autonomy-regulator` skill to enforce the recommended autonomy level
- Use `anti-hallucination-guard` skill to verify all claims before presenting
