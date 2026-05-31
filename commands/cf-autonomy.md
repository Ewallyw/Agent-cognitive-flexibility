---
description: "Set or check the current autonomy level (L0-L4) for cognitive flexibility"
argument-hint: "[L0|L1|L2|L3|L4|status|auto]"
---

# /cf-autonomy — Autonomy Level Control

Set or check the current autonomy level for the cognitive flexibility system. The autonomy level determines how much initiative the agent takes.

## Autonomy Levels

| Level | Name | Behavior |
|-------|------|----------|
| L0 | Strict Obedience | Execute exactly as asked |
| L1 | Clarification | Execute + ask about gaps |
| L2 | Suggestion | Execute + offer 1 alternative |
| L3 | Exploration | Explore options before executing |
| L4 | Discovery | Full research + proposals |

## Workflow

### If $ARGUMENTS is "status" or empty:
Display current autonomy state:
```bash
# Read current state
cat .cognitive-flex/autonomy-state.json 2>/dev/null || echo "No state file found — default is L2"
```

### If $ARGUMENTS is L0/L1/L2/L3/L4:
Override the autonomy level:
```bash
mkdir -p .cognitive-flex
# Write new state
echo '{"current_level": X, "timestamp": "...", "override": true}' > .cognitive-flex/autonomy-state.json
```

Confirm the change:
```
## Autonomy Level Set: L[X]

### What This Means
[Description of behavior at this level]

### Affected Components
- Goal Space Monitor: [how it behaves at this level]
- Divergence-Convergence: [D-C cycle depth]
- Proactive Explorer: [exploration intensity]
- Anti-Hallucination Guard: [verification strictness]
```

### If $ARGUMENTS is "auto":
Score the current task's complexity and automatically set the appropriate level:

1. Rate each dimension (0-2): Ambiguity, Stakeholders, Domain Expertise, Reversibility, Novelty
2. Sum scores → Map to L0-L4
3. Apply risk downgrade if needed
4. Set the level and confirm

## Risk Downgrade Rules
Even with manual override, the system will warn (but not block) if:
- L3/L4 is set for irreversible operations
- L4 is set for security-sensitive tasks
- The user has rejected autonomous behavior earlier in the session
