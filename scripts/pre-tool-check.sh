#!/usr/bin/env bash
# Cognitive Flexibility Plugin — Pre-Tool Check Hook
# Lightweight autonomy awareness check before destructive operations

STATE_FILE=".cognitive-flex/autonomy-state.json"

if [ -f "$STATE_FILE" ]; then
  # Read current autonomy level
  LEVEL=$(python3 -c "import json; print(json.load(open('$STATE_FILE')).get('current_level', 2))" 2>/dev/null || echo "2")
  echo "[CF] Current autonomy level: L${LEVEL}"
else
  echo "[CF] No state file — default L2"
fi

exit 0
