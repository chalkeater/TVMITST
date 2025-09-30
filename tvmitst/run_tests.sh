#!/bin/bash
# Run GUT tests from command line
# Usage: ./run_tests.sh [test_file]

# Godot executable path - adjust if needed
GODOT_BIN="/Users/rschuneman/Downloads/Godot.app/Contents/MacOS/Godot"

# Project path
PROJECT_PATH="/Users/rschuneman/Desktop/dev/TVMITST/tvmitst"

# Change to project directory
cd "$PROJECT_PATH" || exit 1

if [ -z "$1" ]; then
	# Run all tests
	echo "Running all tests..."
	"$GODOT_BIN" --headless -s addons/gut/cli/gut_cli.gd -gconfig=.gutconfig.json
else
	# Run specific test file
	echo "Running test: $1"
	"$GODOT_BIN" --headless -s addons/gut/cli/gut_cli.gd -gselect="$1" -gconfig=.gutconfig.json
fi
