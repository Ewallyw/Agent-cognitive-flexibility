# Cognitive Flexibility Rules

## Autonomy Level Defaults

The agent's autonomy level determines how much initiative it takes:

| Level | Name | Default Behavior |
|-------|------|-----------------|
| L0 | Strict Obedience | Execute exactly as requested, no deviations |
| L1 | Clarification | Execute + ask about obvious gaps |
| L2 | Suggestion | Execute + offer one alternative approach |
| L3 | Exploration | Explore goal space before executing |
| L4 | Discovery | Full proactive research + proposals |

**Default level: L2** unless overridden by user or `/cf-autonomy` command.

## Goal Space Rules

1. Before executing complex tasks (L3+), always scan for implicit goals
2. Present Goal Expansion Report to user before expanding scope
3. Never silently add goals without user confirmation
4. Cap goal expansion at 3x the stated goal scope
5. When user says "just do it" or "直接做", immediately drop to L0

## Divergence-Convergence Rules

1. Never skip divergence for tasks rated L3+
2. Generate at least 5 distinct approaches during divergence
3. Always provide a Rejection Log explaining why approaches were eliminated
4. Convergence must be evidence-based, not intuition-based
5. Never generate more than 4 alternatives to present to the user

## Proactive Exploration Rules

1. Never fabricate resources (tools, files, APIs) that don't exist
2. Verify all discovered resources before suggesting them
3. Cap proactive suggestions at 5 per task
4. Clearly label suggestions as proactive (not requested by user)
5. If a suggestion requires paid services, warn the user

## Anti-Hallucination Rules

1. All factual claims must be tagged: [VERIFIED], [INFERRED], or [UNSUPPORTED]
2. [UNSUPPORTED] claims in critical decisions → BLOCK_AND_REVISE
3. Consistency checks are mandatory before convergence
4. Scope containment is enforced at all times
5. Higher autonomy levels require stricter verification (paradoxically)

## Reflection Rules

1. Trigger reflection after completing major tasks
2. Trigger reflection when stuck in a loop (3+ failed attempts)
3. Bias Scan is the most valuable part — never skip it
4. Reflection must lead to action, not more reflection
5. Cap reflection frequency: no more than once per 5 tool calls

## Plugin Compatibility

When running alongside other Claude Code plugins:
- Cognitive Flexibility operates as a **meta-layer** above task delegation systems
- It ensures the right goals are being pursued before task routing
- Goal Space Monitor can expand tasks before they are delegated to specialized agents
- Divergence-Convergence can explore options before execution begins
- Autonomy Regulator can override default behavior when appropriate
- No known conflicts with existing plugin ecosystems

## Multilingual Support

The plugin supports trigger keywords in multiple languages:

### English Triggers
- "just do it" → L0 (Strict Obedience)
- "what should I watch for" → L1 (Clarification)
- "is there a better way" → L2 (Suggestion)
- "analyze thoroughly" → L3 (Exploration)
- "innovate" / "explore" → L4 (Discovery)
- "reflect" / "review" → Trigger reflection
- "design" / "create" → Trigger goal space analysis

### Chinese Triggers
- "直接做" → L0 (Strict Obedience)
- "帮我看看" → L1 (Clarification)
- "有没有更好的" → L2 (Suggestion)
- "全面分析" → L3 (Exploration)
- "创新/突破/探索" → L4 (Discovery)
- "复盘/反思" → Trigger reflection
- "设计/创建" → Trigger goal space analysis
