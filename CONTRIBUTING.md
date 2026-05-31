# Contributing to Cognitive Flexibility Plugin

Thank you for your interest in contributing! This document provides guidelines for contributing to the MCAF (Metacognitive Agent Framework) plugin for Claude Code.

## How to Contribute

### Reporting Issues

- Use GitHub Issues to report bugs or suggest features
- Include clear reproduction steps for bugs
- Describe the expected vs actual behavior
- Mention your Claude Code version and plugin version

### Submitting Changes

1. **Fork** the repository
2. **Create a feature branch** from `main`:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes** following the guidelines below
4. **Test your changes** with Claude Code
5. **Submit a Pull Request** with a clear description

### Development Guidelines

#### Agent Files (`agents/`)
- Follow the existing YAML frontmatter + Markdown body format
- Include clear `description` with activation triggers and examples
- Specify the appropriate `model` (haiku/sonnet/opus) based on complexity
- Always include **Anti-Patterns** section
- Always include **Integration with MCAF** section

#### Skill Files (`skills/*/SKILL.md`)
- Include clear trigger keywords (English + Chinese where applicable)
- Provide step-by-step process
- Include output templates
- Document integration points with other skills

#### Command Files (`commands/`)
- Use `cf-` prefix for all commands
- Include `description` and `argument-hint` in frontmatter
- Provide clear phase-by-phase workflow
- Reference relevant agents and skills

#### Rules Files (`rules/`)
- Keep rules concise and actionable
- Number each rule for easy reference
- Avoid duplicating content from agent/skill files

#### Scripts (`scripts/`)
- Use `#!/usr/bin/env bash` shebang
- Handle missing dependencies gracefully (e.g., `python3` may not exist)
- Always `exit 0` to avoid blocking Claude Code
- Keep scripts lightweight (hooks have timeout limits)

### Adding New Components

#### New Agent
1. Create `agents/your-agent.md` following the existing format
2. Add corresponding skill in `skills/your-agent/SKILL.md`
3. Add relevant commands in `commands/cf-*.md`
4. Update `rules/cognitive-flexibility.md` if needed
5. Update `README.md` component tables

#### New Skill
1. Create `skills/your-skill/SKILL.md`
2. Add trigger keywords and activation conditions
3. Document the process and output format
4. Update README skill table

#### New Command
1. Create `commands/cf-yourcommand.md`
2. Use `cf-` prefix
3. Include argument hints and workflow phases
4. Update README command table

### Code Style

- **Markdown**: Use consistent heading levels, tables, and code blocks
- **YAML frontmatter**: Always include `name` and `description`
- **Language**: Write documentation in English; add Chinese keywords as supplementary triggers
- **Formatting**: Use the same format patterns as existing files

### Testing

Before submitting a PR:

1. Install the plugin locally:
   ```bash
   /plugin install /path/to/your/local/cognitive-flexibility-plugin
   ```
2. Run `/cf-setup` to verify initialization
3. Test each affected command
4. Verify no errors in hook execution
5. Test with different autonomy levels

### Commit Messages

Use clear, descriptive commit messages:
- `feat: add stakeholder-analysis agent`
- `fix: session-stop hook timezone handling`
- `docs: update README with new commands`
- `refactor: simplify autonomy scoring logic`

## Questions?

Feel free to open an issue for any questions about contributing.
