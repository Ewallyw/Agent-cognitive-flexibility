---
name: anti-hallucination-guard
description: |
  Use this skill to verify that cognitive flexibility outputs are grounded in evidence, not fabricated.
  This is the three-layer safeguard that prevents creative exploration from becoming hallucination.
  Triggers: before presenting expanded goal frames, before convergence decisions, before proactive suggestions.
  Keywords: "verify", "check", "is this real", "confirm", "验证", "确认"
---

# Anti-Hallucination Guard Skill

## Overview

This skill implements the **Three-Layer Anti-Hallucination Safeguard** from the MCAF framework. It ensures that cognitive flexibility (goal expansion, divergence thinking, proactive exploration) produces evidence-based outputs rather than fabricated claims.

## The Three Layers

### Layer 1: Source Verification
**"Where did this come from?"**

| Claim Type | Verification Method | Tool |
|------------|-------------------|------|
| File exists | Glob + Read | `Glob`, `Read` |
| Tool available | Check MCP/plugin registry | `Bash` |
| Code pattern | Grep codebase | `Grep` |
| Best practice | Web search for authoritative source | `WebSearch` |
| API/library | Check docs or registry | `WebSearch`, `Bash` |

**Tags**: `[VERIFIED]` / `[INFERRED]` / `[UNSUPPORTED]`

### Layer 2: Consistency Check
**"Does this make sense given what we know?"**

Check against:
1. **User's stated intent** — Does this align with what the user wants?
2. **Project context** — Does this fit the tech stack and patterns?
3. **Domain constraints** — Does this violate domain rules?
4. **Previous decisions** — Does this contradict earlier decisions?

**Tags**: `CONSISTENT` / `PARTIAL_CONFLICT` / `CONTRADICTORY`

### Layer 3: Scope Containment
**"Is this within reasonable bounds?"**

Rules:
1. Goal expansion ratio ≤ 3x stated goal scope
2. Suggestion count ≤ 5 per task
3. Alternative approaches ≤ 4 in D-C analysis
4. Divergence time ≤ 30% of total task budget

**Tags**: `BOUNDED` / `EXPANDING` / `RUNAWAY`

## Verification Process

### Step 1: Identify Claims
Extract all factual claims from the output being verified.

### Step 2: Source Verify Each Claim
Run the appropriate verification tool for each claim type.

### Step 3: Check Consistency
Cross-reference against known context.

### Step 4: Assess Scope
Calculate expansion ratio and check bounds.

### Step 5: Issue Verdict

```
## Verification Report

### Source Verification
| Claim | Type | Status | Evidence |
|-------|------|--------|----------|
| ... | file/tool/knowledge | VERIFIED/INFERRED/UNSUPPORTED | ... |

### Consistency Check
- Intent: CONSISTENT/PARTIAL_CONFLICT/CONTRADICTORY
- Context: CONSISTENT/PARTIAL_CONFLICT/CONTRADICTORY
- Domain: CONSISTENT/PARTIAL_CONFLICT/CONTRADICTORY

### Scope Assessment
- Expansion: Xx → BOUNDED/EXPANDING/RUNAWAY
- Suggestions: X/5 → BOUNDED/EXPANDING/RUNAWAY

### Verdict: PROCEED / PROCEED_WITH_WARNINGS / BLOCK_AND_REVISE
```

## Integration

All MCAF components route their outputs through this guard before user presentation or commitment.
