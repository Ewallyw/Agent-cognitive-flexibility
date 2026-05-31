---
description: "Verify that cognitive flexibility outputs are grounded in evidence — run the anti-hallucination guard"
argument-hint: "[claim to verify, or leave blank to verify the most recent output]"
---

# /cf-verify — Anti-Hallucination Verification

Run the three-layer anti-hallucination guard on recent outputs. Verify that claims are evidence-based and scope is bounded.

## Workflow

### Phase 1: Claim Extraction
Extract all factual claims from:
- If $ARGUMENTS provided: verify that specific claim
- If no arguments: verify the most recent Goal Expansion Report, D-C Analysis, or Proactive Exploration Report

### Phase 2: Layer 1 — Source Verification
For each claim, verify its source:

| Claim Type | Verification Action |
|------------|-------------------|
| "File X exists" | `Glob` for the file, then `Read` to confirm |
| "Tool Y is available" | Check MCP registry / `which` command |
| "Pattern Z is used" | `Grep` the codebase for the pattern |
| "Best practice is W" | `WebSearch` for authoritative source |
| "Library V supports..." | Check official docs or registry |

Tag each claim: `[VERIFIED]` / `[INFERRED]` / `[UNSUPPORTED]`

### Phase 3: Layer 2 — Consistency Check
Cross-reference claims against:
1. User's stated intent — Alignment check
2. Project context — Tech stack and pattern fit
3. Domain constraints — Rule compliance
4. Previous decisions — Contradiction check

Tag: `CONSISTENT` / `PARTIAL_CONFLICT` / `CONTRADICTORY`

### Phase 4: Layer 3 — Scope Containment
Check bounds:
- Goal expansion ratio ≤ 3x?
- Suggestion count ≤ 5?
- Alternative count ≤ 4?
- Divergence time ≤ 30% of budget?

Tag: `BOUNDED` / `EXPANDING` / `RUNAWAY`

### Phase 5: Verdict
```
## Verification Report

### Source Verification
| Claim | Status | Evidence |
|-------|--------|----------|
| ... | VERIFIED/INFERRED/UNSUPPORTED | ... |

### Consistency: CONSISTENT/PARTIAL_CONFLICT/CONTRADICTORY
### Scope: BOUNDED/EXPANDING/RUNAWAY

### Verdict
[PROCEED / PROCEED_WITH_WARNINGS / BLOCK_AND_REVISE]

### Warnings (if any)
- [Warning detail]
```

### Phase 6: Action
- **PROCEED**: Continue with current approach
- **PROCEED_WITH_WARNINGS**: Continue but inform user of concerns
- **BLOCK_AND_REVISE**: Stop, revise the flagged claims, then re-verify
