---
name: autonomy-regulator
description: |
  Use this skill to determine and enforce the appropriate autonomy level for the current task.
  Triggers: new task starts, user changes context, task complexity shifts, or when other MCAF
  components need to know the current autonomy level.
  Keywords: "autonomy", "level", "just do it", "全面分析", "探索", "直接做"
---

# Autonomy Regulator Skill

## Overview

This skill implements the **Autonomy Regulator** from the MCAF framework. It dynamically adjusts how much initiative the agent takes based on task characteristics, user preferences, and risk assessment.

## The L0-L4 Autonomy Spectrum

```
L0 ──── L1 ──── L2 ──── L3 ──── L4
Strict   Ask     Suggest  Explore  Discover
```

### Quick Reference

| Level | Name | When | What Agent Does |
|-------|------|------|-----------------|
| L0 | Strict Obedience | "just do it" / "直接做", simple task | Execute exactly as asked |
| L1 | Clarification | Ambiguous but narrow | Execute + ask about gaps |
| L2 | Suggestion | Has alternatives | Execute + offer 1 alternative |
| L3 | Exploration | Creative/complex | Explore options before executing |
| L4 | Discovery | Open-ended strategic | Full research + proposals |

## Task Complexity Scoring

Rate each dimension 0-2 and sum:

| Dimension | 0 | 1 | 2 |
|-----------|---|---|---|
| Ambiguity | Clear spec | Some gaps | Very open-ended |
| Stakeholders | Single user | Small team | Multiple parties |
| Domain Expertise | Common | Some specialization | Deep expertise needed |
| Reversibility | Easily undone | Moderate cost | Irreversible |
| Novelty | Routine | Some creativity | Breakthrough needed |

**Mapping**: 0-2 → L0, 3-4 → L1, 5-6 → L2, 7-8 → L3, 9-10 → L4

## User Override Signals

| User Says | Override Level |
|-----------|---------------|
| "just do it" / "直接做" | L0 |
| "what should I watch for" / "帮我看看要注意什么" | L1 |
| "is there a better way" / "有没有更好的" | L2 |
| "analyze thoroughly" / "全面分析" | L3 |
| "innovate" / "创新/突破/探索" | L4 |

## Risk Downgrade Rules

If ANY condition is true, **downgrade by 1 level**:
- Financial or legal implications
- Irreversible changes (DB migrations, production deploys)
- Security-sensitive operations
- User previously rejected autonomous behavior in this session

## Process

### Step 1: Score Task Complexity
Fill in the scoring table above.

### Step 2: Check User Override
Look for explicit autonomy signals in the user's message.

### Step 3: Apply Risk Downgrade
If any risk condition applies, decrease the level by 1.

### Step 4: Enforce Level
```
## Autonomy Decision

- Task Complexity Score: [X]/10 → Initial Level: L[Y]
- User Override: [None/L0-L4] → Adjusted Level: L[Z]
- Risk Downgrade: [Yes/No] → Final Level: L[W]

### Level L[W] Behavior:
[Description of what this level means for current task]
```

### Step 5: Persist State
Write the autonomy level to `.cognitive-flex/autonomy-state.json`:
```json
{
  "current_level": 2,
  "timestamp": "...",
  "task_description": "...",
  "complexity_score": 5,
  "override": null,
  "risk_downgrade": false
}
```

## Integration

- `goal-space-monitor` uses this level to decide how much to expand goals
- `divergence-convergence` uses this level to determine D-C cycle depth
- `proactive-explorer` uses this level to decide exploration intensity
- `anti-hallucination-guard` uses this level to set verification strictness (higher autonomy → stricter)
