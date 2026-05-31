---
name: metacognitive-reflection
description: |
  Use this skill to trigger a metacognitive reflection cycle — the agent steps back and evaluates
  its own thinking process, identifying biases, blind spots, and improvement opportunities.
  Triggers: after completing a major task, when the agent seems stuck in a loop, when the user
  expresses frustration, or periodically during long sessions.
  Keywords: "reflect", "review process", "what went wrong", "why stuck", "复盘", "反思"
---

# Metacognitive Reflection Skill

## Overview

This skill implements **metacognitive reflection** — the agent's ability to think about its own thinking process. Inspired by ReflAct (EMNLP 2025) and the concept of goal-state reflection.

## When to Activate

- After completing a **major task** (automatic trigger)
- When the agent is **stuck in a loop** (3+ failed attempts)
- When the user **expresses frustration** ("this isn't working", "try something different")
- **Periodically** during long sessions (every 10 tool calls)
- User explicitly asks for reflection: "复盘", "反思", "review the process", "reflect"

## Reflection Protocol

### Phase 1: State Assessment

```
## Current State

### Task Progress
- Original goal: [what was asked]
- Current status: [where we are]
- Steps taken: [count]
- Time invested: [estimate]

### Stuck Detection
- Loops detected: [count of repeated approaches]
- Failed attempts: [count]
- User corrections: [count]
```

### Phase 2: Bias Scan

Check for common cognitive biases:

| Bias | Check | Present? |
|------|-------|----------|
| **Anchoring** | Am I stuck on the first approach? | Yes/No |
| **Confirmation** | Am I only seeking evidence that supports my plan? | Yes/No |
| **Sunk Cost** | Am I continuing a failing approach because I've invested time? | Yes/No |
| **Availability** | Am I using a familiar approach instead of the best one? | Yes/No |
| **Premature Convergence** | Did I consider enough alternatives? | Yes/No |
| **Scope Creep** | Has the task expanded beyond the user's intent? | Yes/No |

### Phase 3: ReflAct Goal-State Check

From ReflAct: Compare **current state** vs **goal state**:
1. What was the **original goal state**? (What does "done" look like?)
2. What is the **current state**? (Where are we now?)
3. What is the **gap**? (What's missing?)
4. Is the gap **narrowing** or **widening**? (Making progress or not?)
5. Should the **goal state** be revised? (Was our target wrong?)

### Phase 4: Reflection Output

```
## Metacognitive Reflection

### What I Was Thinking
[Narrative of the approach taken and why]

### Biases Detected
- [Bias]: [How it manifested] → [Correction]

### Goal-State Gap
- Target: [original goal state]
- Current: [current state]
- Gap: [what's missing]
- Trend: [narrowing/widening/stable]

### Course Correction
- [What to change] — Reason: [why]
- [What to try next] — Reason: [why]

### Key Lesson
[One sentence capturing what was learned]
```

## Integration with MCAF

| Component | Interaction |
|-----------|-------------|
| Goal Space Monitor | Reflection may reveal that the goal frame was too narrow |
| Divergence-Convergence | Reflection may trigger a new D-C cycle |
| Autonomy Regulator | Repeated failures may warrant autonomy adjustment |
| Proactive Explorer | Knowledge gaps identified in reflection → new exploration |
| Anti-Hallucination Guard | Reflection checks for fabricated reasoning |

## Anti-Patterns

- **NEVER** use reflection as an excuse for inaction (reflection → action, not reflection → more reflection)
- **NEVER** reflect more than once per 5 tool calls (over-reflection is a form of procrastination)
- **NEVER** skip the Bias Scan — this is the most valuable part
- **NEVER** write reflections that are purely self-congratulatory
