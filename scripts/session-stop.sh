#!/usr/bin/env bash
# Cognitive Flexibility Plugin — Session Stop Hook
# Saves session state and updates task history

STATE_DIR=".cognitive-flex"
SESSION_FILE="$STATE_DIR/current-session.json"

if [ -f "$SESSION_FILE" ]; then
  # Update session end time
  END_TIME=$(date -Iseconds 2>/dev/null || date -u +%Y-%m-%dT%H:%M:%SZ)
  python3 -c "
import json, sys
try:
    with open('$SESSION_FILE') as f:
        data = json.load(f)
    data['end_time'] = '$END_TIME'
    with open('$SESSION_FILE', 'w') as f:
        json.dump(data, f, indent=2)
except Exception:
    pass
" 2>/dev/null || true
fi

exit 0
