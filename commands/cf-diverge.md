---
description: "Start a divergence-convergence thinking cycle — explore multiple solution paths before committing to one"
argument-hint: "[problem or decision to explore, or leave blank for current task]"
---

# /cf-diverge — Divergence-Convergence Cycle

Launch a structured Divergence-Convergence thinking cycle for the current problem. This prevents premature convergence on suboptimal solutions.

## Workflow

### Phase 1: Problem Framing
- If $ARGUMENTS provided, frame that problem
- If no arguments, use the current task context

Determine cycle depth based on current autonomy level:
- L0-L1: Skip D-C (just execute)
- L2: 1 cycle, 3 approaches
- L3: 1-2 cycles, 5 approaches
- L4: 2-3 cycles, 5+ approaches

### Phase 2: DIVERGENCE (Explore)
Generate multiple distinct approaches using:

1. **Direct approach** — The most obvious/standard solution
2. **Analogy approach** — How would a different domain solve this?
3. **Constraint-relaxation** — What if time/budget/skill were not limiting?
4. **Inverse approach** — What would make this worse? (Then invert)
5. **Hybrid approach** — Combine the best elements of 2+ approaches

For each approach, note:
- Source domain/inspiration
- Novelty level (High/Medium/Low)
- Key insight or differentiator

### Phase 3: CONVERGENCE (Evaluate)
Apply the evaluation matrix:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| Feasibility | 30% | Can we actually build this? |
| Risk | 25% | What's the worst case? |
| Evidence | 25% | How well-supported is this? |
| Time | 20% | How long to implement? |

Score each approach and rank them.

### Phase 4: Present Results
```
## Divergence-Convergence Results

### Generated Approaches
| # | Approach | Novelty | Key Insight |
|---|----------|---------|-------------|
| 1 | ... | ... | ... |
| ... | ... | ... | ... |

### Evaluation
| # | Feasibility | Risk | Evidence | Time | Score |
|---|-------------|------|----------|------|-------|
| ... | ... | ... | ... | ... | ... |

### Selected: Approach #[X]
**Reason**: [evidence-based justification]

### Rejection Log
- Rejected #[Y]: [why]
```

### Phase 5: Verify & Execute
- Run anti-hallucination guard on the selected approach
- Get user confirmation
- Execute the chosen approach
