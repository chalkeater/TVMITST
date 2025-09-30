# ESC Scripts for Scene 1: Basement

This folder contains interaction scripts for items in the basement scene.

## Current Items

### sticky_note_1.esc

- **Purpose**: First Spanish word encounter
- **Teaches**: "hola" (hello)
- **Events**: :look, :use, :setup
- **Story role**: Dave's introduction to the mysterious Spanish notes

### wifi_router.esc

- **Purpose**: WiFi password puzzle
- **Teaches**: "wifi", "contraseña" (password), "necesito" (I need), "dónde está" (where is)
- **Events**: :look, :use, :use sticky_note_1, :setup
- **Story role**: Modern desperation meets language learning
- **Puzzle**: Combine sticky_note_1 with router to connect (password is "hola")

### storage_box.esc

- **Purpose**: Organization puzzle and Dave's existential chaos
- **Teaches**: "caja" (box), "organización" (organization), "perdido" (lost), "confundido" (confused)
- **Events**: :look, :use, :use sticky_note_1, :setup
- **Story role**: Physical manifestation of Dave's life situation

## How to Connect in Godot

1. Open `basement_scene_1.tscn`
2. Select an ESCItem node (e.g., `StickyNote1`)
3. In Inspector → **Esc Script** property
4. Browse to `res://items/[item_name].esc`
5. Set **Tooltip Name** (what shows on hover)
6. Save scene

## ESC Event Reference

- `:look` - Player examines item
- `:use` - Player interacts with item
- `:use [other_item]` - Combine two items
- `:setup` - Runs when room loads (before visible)
- `:ready` - Runs after room is shown
- `:exit_scene` - Runs when leaving through an exit

## Spanish Learning Integration

All scripts use `call(SpanishLearningManager.teach_word(english, spanish))` to register vocabulary progress.

Scene 1 teaches 23 Spanish words through natural interactions with these items.
