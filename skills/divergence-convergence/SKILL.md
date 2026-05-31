---
name: divergence-convergence
description: |
  Use this skill when the agent needs to explore multiple solution paths before committing.
  Triggers: complex decision-making, architecture design, creative problem-solving, user asks for
  alternatives, or the current approach has failed.
  Keywords: "brainstorm", "explore options", "alternatives", "compare approaches", "which is better",
  "发散", "收敛", "方案对比", "头脑风暴"
---

# Divergence-Convergence Skill

## Overview

This skill implements the **Divergence-Convergence (D-C) Thinking Cycle** from the MCAF framework. It prevents premature convergence on suboptimal solutions by enforcing structured exploration before selection.

## When to Activate

- Complex decision-making with multiple valid approaches
- Architecture design or system design tasks
- Creative problem-solving where "the obvious answer" might not be the best
- User asks for alternatives or comparisons
- Current approach has failed or is suboptimal
- User says: "compare", "alternatives", "which approach", "pros and cons"

## The D-C Cycle

### Phase 1: DIVERGENCE (Explore)

**Duration**: Allow 5-10 minutes of exploration time

**Rules**:
1. **No criticism** — Every idea is valid during divergence
2. **Quantity over quality** — Aim for 5+ distinct approaches
3. **Cross-domain borrowing** — Look at how other fields solve similar problems
4. **Constraint relaxation** — What if limitations didn't exist?
5. **Inverse thinking** — What would make this worse? (Then invert)

**Divergence Techniques**:
- **SCAMPER**: Substitute, Combine, Adapt, Modify, Put to other use, Eliminate, Reverse
- **Analogy**: How would [different domain] solve this?
- **Extreme users**: What would a beginner vs expert need?
- **Time travel**: What would the future version look like?

### Phase 2: CONVERGENCE (Evaluate & Select)

**Steps**:
1. Apply real-world constraints (time, skill, resources, existing tech stack)
2. Weight by available evidence (not intuition)
3. Assess risk of each approach
4. Check feasibility (can this actually be built?)
5. Select the best option OR propose a hybrid

**Convergence Criteria**:
| Criterion | Weight | Description |
|-----------|--------|-------------|
| Feasibility | 30% | Can we actually build this? |
| Risk | 25% | What's the worst case? |
| Evidence | 25% | How well-supported is this approach? |
| Time | 20% | How long to implement? |

### Phase 3: OUTPUT

```
## Divergence-Convergence Analysis

### [DIVERGENCE] Generated Approaches
| # | Approach | Source | Novelty | Key Insight |
|---|----------|--------|---------|-------------|
| 1 | ... | Direct | Low | ... |
| 2 | ... | Analogy: [domain] | Med | ... |
| 3 | ... | Constraint relaxation | High | ... |
| 4 | ... | Inverse thinking | Med | ... |
| 5 | ... | Cross-domain: [domain] | High | ... |

### [CONVERGENCE] Evaluation
| Approach | Feasibility(30%) | Risk(25%) | Evidence(25%) | Time(20%) | Score |
|----------|---------|------|----------|------|-------|
| 1 | H/M/L | H/M/L | H/M/L | H/M/L | A/B/C |
| ... | ... | ... | ... | ... | ... |

### Selection: [Approach #X]
**Reason**: [evidence-based justification]

### Rejection Log
- Rejected #Y: [why]
- Rejected #Z: [why]
```

## Cycle Control

| Autonomy Level | D-C Cycles | Divergence Depth |
|---------------|------------|------------------|
| L0-L1 | 0 | Skip D-C entirely |
| L2 | 1 | Quick (3 approaches) |
| L3 | 1-2 | Standard (5 approaches) |
| L4 | 2-3 | Deep (5+ approaches per cycle) |

## Integration

- Receives expanded goal frame from `goal-space-monitor`
- Cycle depth controlled by `autonomy-regulator`
- Research support from `proactive-explorer`
- All convergence choices verified by `anti-hallucination-guard`
