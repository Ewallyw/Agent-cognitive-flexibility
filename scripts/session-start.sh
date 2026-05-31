#!/usr/bin/env bash
# Cognitive Flexibility Plugin — Session Start Hook
# Initializes state directory and loads autonomy preferences

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-.}"
STATE_DIR=".cognitive-flex"

# Create state directory if it doesn't exist
mkdir -p "$STATE_DIR"

# Initialize autonomy state if not present
if [ ! -f "$STATE_DIR/autonomy-state.json" ]; then
  cat > "$STATE_DIR/autonomy-state.json" << 'STATEEOF'
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
STATEEOF
fi

# Create session log
SESSION_ID="$(date +%Y%m%d_%H%M%S)_$$"
echo "{\"session_id\": \"$SESSION_ID\", \"start_time\": \"$(date -Iseconds 2>/dev/null || date -u +%Y-%m-%dT%H:%M:%SZ)\", \"autonomy_level\": 2}" > "$STATE_DIR/current-session.json"

exit 0
