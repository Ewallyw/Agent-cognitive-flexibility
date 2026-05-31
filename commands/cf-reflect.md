---
description: "Trigger a metacognitive reflection — step back and evaluate the agent's own thinking process"
argument-hint: "[optional: specific concern or 'stuck'/'frustrated'/'review']"
---

# /cf-reflect — Metacognitive Reflection

Step back from execution and evaluate the agent's own thinking process. Identify biases, blind spots, and course corrections.

## Workflow

### Phase 1: State Assessment
Document the current state:
- Original goal: What was asked
- Current progress: Where we are
- Steps taken: Count of tool calls / iterations
- Time invested: Estimated effort
- Stuck indicators: Loops, failed attempts, user corrections

### Phase 2: Bias Scan
Check for common cognitive biases:

| Bias | Question | Detected? |
|------|----------|-----------|
| Anchoring | Am I stuck on the first approach? | |
| Confirmation | Am I only seeking supporting evidence? | |
| Sunk Cost | Am I continuing because of invested time? | |
| Availability | Am I using a familiar but suboptimal approach? | |
| Premature Convergence | Did I consider enough alternatives? | |
| Scope Creep | Has the task expanded beyond user intent? | |

If $ARGUMENTS contains "stuck": Focus on Anchoring, Sunk Cost, and Availability biases.
If $ARGUMENTS contains "frustrated": Focus on Premature Convergence and Scope Creep.

### Phase 3: Goal-State Gap Analysis (ReflAct)
1. What was the original goal state? (What does "done" look like?)
2. What is the current state?
3. What is the gap?
4. Is the gap narrowing, widening, or stable?
5. Should the goal state be revised?

### Phase 4: Course Correction
Based on detected biases and gap analysis:

```
## Metacognitive Reflection

### What I Was Thinking
[narrative of approach and reasoning]

### Biases Detected
- [Bias]: [how it manifested] → [correction]

### Goal-State Gap
- Target: [goal state]
- Current: [current state]
- Gap: [what's missing]
- Trend: [narrowing/widening/stable]

### Course Correction
1. [What to change] — Reason: [why]
2. [What to try next] — Reason: [why]

### Key Lesson
[One sentence]
```

### Phase 5: Act on Reflection
- If biases detected → adjust approach immediately
- If gap widening → trigger `/cf-diverge` for new approaches
- If goal state wrong → trigger `/cf-analyze` to re-scan goal space
- If on track → continue with confidence
