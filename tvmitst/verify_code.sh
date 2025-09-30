#!/bin/bash
# Quick verification that project compiles (for AI agents)
# This doesn't run tests but verifies no syntax errors

GODOT_BIN="/Users/rschuneman/Downloads/Godot.app/Contents/MacOS/Godot"
PROJECT_PATH="/Users/rschuneman/Desktop/dev/TVMITST/tvmitst"

cd "$PROJECT_PATH" || exit 1

echo "Verifying project compiles..."
"$GODOT_BIN" --headless --path . --quit 2>&1 | grep -i "error" || echo "✅ No compilation errors detected"
