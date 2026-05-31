---
description: "Initialize the Cognitive Flexibility plugin — create state directory, set default autonomy level, and verify installation"
---

# /cf-setup — Plugin Setup

Initialize the Cognitive Flexibility (MCAF) plugin for the current project.

## Workflow

### Step 1: Create State Directory
```bash
mkdir -p .cognitive-flex
```

### Step 2: Initialize Autonomy State
Write default state:
```bash
cat > .cognitive-flex/autonomy-state.json << 'EOF'
{
  "current_level": 2,
  "timestamp": "",
  "task_history": [],
  "user_preferences": {
    "default_level": 2,
    "max_level": 4,
    "downgrade_history": []
  }
}
EOF
```

### Step 3: Verify Plugin Components
Check that all MCAF components are available:
- [ ] Goal Space Monitor agent
- [ ] Divergence-Convergence agent
- [ ] Autonomy Regulator agent
- [ ] Proactive Explorer agent
- [ ] Anti-Hallucination Guard agent
- [ ] All 6 skills
- [ ] All 7 commands

### Step 4: Display Configuration
```
## Cognitive Flexibility Plugin — Initialized

### State Directory
.cognitive-flex/

### Default Autonomy Level: L2 (Suggestion)
The agent will execute tasks and offer one alternative approach.

### Available Commands
| Command | Purpose |
|---------|---------|
| /cf-analyze | Analyze goal space before execution |
| /cf-diverge | Run divergence-convergence cycle |
| /cf-reflect | Trigger metacognitive reflection |
| /cf-autonomy | Set/check autonomy level |
| /cf-explore | Proactive resource exploration |
| /cf-verify | Anti-hallucination verification |
| /cf-setup | Re-run this setup |

### Autonomy Levels
| Level | Name | Behavior |
|-------|------|----------|
| L0 | Strict Obedience | Execute exactly as asked |
| L1 | Clarification | Execute + ask about gaps |
| L2 | Suggestion | Execute + offer alternative |
| L3 | Exploration | Explore before executing |
| L4 | Discovery | Full research + proposals |

### Quick Reference
- Say "just do it" → L0 mode
- Say "analyze thoroughly" / "全面分析" → L3 mode
- Say "innovate" / "探索" → L4 mode
- Use /cf-autonomy L[X] to manually set level
```

### Step 5: Add to .gitignore
If not already present:
```bash
echo ".cognitive-flex/" >> .gitignore
```
