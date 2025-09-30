# TVMITST Testing Guide

## For AI Agents: Test-Driven Development Workflow

This project uses GUT (Godot Unit Test) for automated testing. **AI agents should run tests after making changes to validate functionality.**

## Quick Start

**IMPORTANT: First-time setup**
Enable the GUT plugin in Godot:

1. Open project in Godot
2. Go to **Project → Project Settings → Plugins**
3. Enable the **"Gut"** plugin
4. Restart Godot if prompted

### ⚠️ Current Testing Status

**✅ Godot Editor (Recommended):**

1. Open Godot
2. Bottom panel → **GUT** tab
3. Click **Run All** button

**✅ Quick Code Verification (For AI Agents):**

```bash
./verify_code.sh  # Verifies project compiles
```

**⚠️ CLI Test Runner:** Currently has compatibility issues with Godot 4.4.1

```bash
./run_tests.sh  # Not working - use Godot editor instead
```

## Golden Path Tests

These tests MUST remain green. They validate core functionality:

### `test_language_phase.gd` - Language Mixing

Tests the `mixed_text()` function that blends EN/SP based on learning phase:

- ✅ Phase 0.0 → English only
- ✅ Phase 1.0 → Spanish only
- ✅ Phase 0.5 → Mixed display
- ✅ Edge cases (negative, > 1.0)

### `test_vocabulary_learning.gd` - Learning Mechanics

Tests core vocabulary learning system:

- ✅ Words are marked as learned
- ✅ Stress affects initial mastery
- ✅ Acceptance moments upgrade mastery
- ✅ Progress calculation works
- ✅ Translation lookup works
- ✅ Mastery level hierarchy works

## AI Development Workflow

### 1. Before Making Changes

```bash
# Ensure tests are green
./run_tests.sh
```

### 2. Make Your Changes

Edit `.gd` files as needed

### 3. Run Tests Again

```bash
# Run all tests
./run_tests.sh

# Or run specific test if you know which area you changed
./run_tests.sh test_vocabulary_learning.gd
```

### 4. If Tests Fail

- Read the error message carefully
- Check which assertion failed
- Fix the code or update the test if requirements changed
- Re-run tests until green

### 5. Add New Tests

When adding new features, create tests in `/tests/`:

```gdscript
extends GutTest

var your_manager: Node

func before_each():
    your_manager = load("res://scripts/YourScript.gd").new()
    add_child_autofree(your_manager)

func test_your_feature():
    # Arrange
    var input = "test data"

    # Act
    var result = your_manager.your_function(input)

    # Assert
    assert_eq(result, "expected", "Description of what should happen")
```

## Test Commands Reference

### From Cursor/CLI

```bash
# All tests
./run_tests.sh

# Specific test file
./run_tests.sh test_language_phase.gd

# Verbose output
godot --headless -s addons/gut/gut_cmdln.gd -gconfig=.gutconfig.json -gverbose=true
```

### From Godot Editor

- **Run All**: Bottom panel → GUT → Run All
- **Run Single**: Bottom panel → GUT → Select test → Run
- **View Results**: Check output in GUT panel

## Godot Executable Path

The `run_tests.sh` assumes Godot is at:

```
/Applications/Godot.app/Contents/MacOS/Godot
```

If your Godot is elsewhere, edit `run_tests.sh` and update `GODOT_BIN`.

## Continuous Integration

Add to your CI pipeline:

```yaml
# .github/workflows/test.yml example
- name: Run Tests
  run: |
    chmod +x run_tests.sh
    ./run_tests.sh
```

## GUT Assertions Cheatsheet

```gdscript
# Equality
assert_eq(got, expected, "message")
assert_ne(got, expected, "message")

# Boolean
assert_true(value, "message")
assert_false(value, "message")

# Null checks
assert_null(value, "message")
assert_not_null(value, "message")

# Numeric comparisons
assert_gt(value, threshold, "message")  # greater than
assert_lt(value, threshold, "message")  # less than
assert_between(value, min, max, "message")

# String operations
assert_string_contains(text, substring, "message")
assert_string_starts_with(text, prefix, "message")
assert_string_ends_with(text, suffix, "message")

# Collections
assert_has(collection, item, "message")
assert_does_not_have(collection, item, "message")
```

## Writing Good Tests

### ✅ Good Test Practices

- **One concept per test** - Test one thing at a time
- **Clear names** - `test_stress_affects_initial_mastery()` not `test_1()`
- **Arrange-Act-Assert** - Set up, execute, verify
- **Use descriptive messages** - Help future you understand failures

### ❌ Avoid

- Testing implementation details
- Overly complex test setup
- Tests that depend on other tests
- Hard-coded timing/delays (use signals)

## Debugging Failed Tests

1. **Read the assertion message** - it tells you what was expected vs actual
2. **Check the test file** - understand what it's validating
3. **Run in Godot Editor** - use GUT panel for better output
4. **Add print statements** - `print()` works in tests
5. **Use gut.p()** - Pretty print: `gut.p(my_variable)`

## Adding Tests for New Features

When implementing a new feature:

1. **Write test first** (TDD approach):

   ```gdscript
   func test_new_feature():
       # This will fail initially
       assert_true(manager.new_feature_works())
   ```

2. **Implement the feature** until test passes

3. **Keep tests updated** as requirements change

## Test Results Format

Tests output to console and optionally to XML:

```
res://tests/results.xml  # JUnit format for CI tools
```

## Questions?

- GUT Documentation: https://github.com/bitwes/Gut/wiki
- Godot Testing: https://docs.godotengine.org/en/stable/contributing/development/testing_tutorials.html
