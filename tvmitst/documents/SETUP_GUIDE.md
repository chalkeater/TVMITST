# Complete Setup Guide: "This Very Moment Is The Spanish Teacher"

## Project Status: ✅ Foundation Complete - Ready for Scene 1 Implementation

This guide documents the journey from a clean Godot project to a working Escoria foundation with Scene 1 structure in place.

---

## ✅ COMPLETED STEPS

### ✅ Step 1: Project Structure Created

- Folder structure created for Escoria-based point-and-click adventure
- Spanish Learning Manager system designed and implemented
- Scene 1 vocabulary data (23 words) prepared in `data/vocabulary/scene_1_basement.json`
- Original scripts backed up to `backup_scripts/`

### ✅ Step 2: Escoria Plugin Installed

- Downloaded escoria-core from GitHub
- Installed to: `tvmitst/addons/escoria-core/`
- Plugin files properly structured and verified

### ✅ Step 3: Escoria Plugin Enabled

- Escoria plugin enabled in Project Settings > Plugins
- Project reloaded successfully
- Escoria autoloads visible in Project Settings > AutoLoad
- SpanishLearningManager autoload confirmed and working

### ✅ Step 4: Game Start Script Configured

- Created `game_start.esc` with proper ESC syntax
- **Fixed syntax issues**: ESC commands use function call format `command("arg")` not `command arg`
- Configured `:init` and `:newgame` events
- Successfully loads basement_scene_1.tscn

### ✅ Step 5: Scene 1 Structure Created

- ESCRoom scene created as `basement_scene_1.tscn`
- Set `global_id = "basement_scene_1"`
- Camera limits configured: `Rect2(0, 0, 1920, 1080)`
- Background (1920x1080) with dark gray placeholder color
- Scene script extends ESCRoom properly

### ✅ Step 6: Interactive Items Added

**Three ESCItem nodes configured with global_ids:**

- `StickyNote1` → `global_id = "sticky_note_1"` (yellow placeholder at 419, 30)
- `WiFiRouter` → `global_id = "wifi_router"` (green placeholder at 121, 940)
- `StorageBox` → `global_id = "storage_box"` (orange placeholder at 984, 805)

All items have:

- Proper collision shapes for clicking
- Visual ColorRect placeholders
- Ready for Spanish learning integration

### ✅ Step 7: Dave Character Added

- ESCPlayer scene created as `dave.tscn`
- Set `global_id = "dave"`
- Blue placeholder rectangle (32x64) visible
- Positioned at center screen (960, 540)
- ESCLocation marker for start position configured

### ✅ Step 8: Technical Issues Resolved

**Fixed critical errors:**

1. ✅ ESC script syntax (function call format with parentheses)
2. ✅ All `global_id` properties set (room + all items + player)
3. ✅ Camera limits configured properly
4. ✅ ESCLocation script assigned correctly to Marker2D node
5. ✅ Game scene configuration verified

### ✅ Step 9: Game Successfully Launches! 🎉

**Current working state:**

- Game runs without crashes
- Scene fades in/out (Escoria transitions working)
- Console shows:
  - "SpanishLearningManager ready - integrating with Escoria"
  - "Loaded Scene 1 vocabulary: 23 words"
  - "TVMITST: Spanish Learning Adventure is starting..."
  - "Scene 1: Basement loaded - Dave's beautiful disaster begins"
  - "Dave's stress level: 0.8 (arriving at rock bottom)"

**Visual elements visible:**

- Dark gray background (1920x1080)
- Blue rectangle (Dave) at center
- Yellow sticky note (top left)
- Green WiFi router (bottom left)
- Orange storage box (bottom right)

---

## 🎯 CURRENT STATUS: Foundation Complete!

### What Works Now:

- ✅ Escoria point-and-click framework operational
- ✅ Scene 1 basement with proper ESCRoom setup
- ✅ Spanish Learning Manager tracking vocabulary
- ✅ Dave character visible and positioned
- ✅ All interactive items configured with global_ids
- ✅ Camera and scene transitions working
- ✅ No crashes or critical errors

### What's Ready for Implementation:

1. **Scene 1 Puzzles** (from FINAL_SCENE_PROGRESSION.md):

   - Basement Organization puzzle
   - WiFi password decoder puzzle
   - Sticky note mystery puzzle

2. **Character Art** (from COMPLETE_GAME_DESIGN.md):

   - Dave visual design (Monkey Island/Grim Fandango style)
   - Item artwork replacing placeholders
   - Basement environment art

3. **Spanish Learning Mechanics**:
   - Click interactions triggering vocabulary
   - Translation tooltips
   - Progress tracking UI

---

## 📁 CURRENT PROJECT STRUCTURE

```
tvmitst/
├── addons/
│   └── escoria-core/          # ✅ Escoria plugin (installed & working)
├── basement_scene_1.gd        # ✅ Scene 1 room script
├── basement_scene_1.tscn      # ✅ Scene 1 with placeholders
├── dave.tscn                  # ✅ Player character scene
├── game_start.esc             # ✅ Game initialization script
├── scenes/
│   ├── rooms/
│   │   ├── basement_scene_1.gd
│   │   └── basement_scene_1.gd.uid
│   └── ui/
├── scripts/
│   ├── DialogueManager.gd
│   ├── DialogueUI.gd
│   ├── LearnableObject.gd
│   ├── NPC.gd
│   ├── Player.gd
│   ├── SpanishLearningManager.gd  # ✅ Autoload working
│   └── StoryData.gd
├── data/
│   └── vocabulary/
│       └── scene_1_basement.json  # ✅ 23 Spanish words ready
├── documents/                 # ✅ Complete game design docs
│   ├── DEVELOPMENT_ROADMAP.md
│   ├── LANGUAGE_LEARNING_MAP.md
│   ├── PRD.md
│   └── SETUP_GUIDE.md (this file)
└── story/                     # ✅ Detailed narrative & characters
    ├── COMPLETE_GAME_DESIGN.md
    ├── FINAL_CHARACTER_GUIDE.md
    ├── FINAL_INTEGRATED_NARRATIVE.md
    ├── FINAL_SCENE_PROGRESSION.md
    └── VOCABULARY_REFERENCE.md
```

---

## 🚀 NEXT STEPS: Scene 1 Implementation

### Priority 1: Character Visual Design (Week 1)

**Goal**: Replace Dave placeholder with actual character art

**From COMPLETE_GAME_DESIGN.md**:

- Style: "Hand-drawn 2D art inspired by Monkey Island/Grim Fandango"
- Warm, absurdist visual comedy
- Expressive character faces

**Dave's Look** (from FINAL_CHARACTER_GUIDE.md):

- Age 34, disheveled but trying
- Carries clipboard/phone with spreadsheets visible
- Expressions: confusion, determination, accidental enlightenment
- Quirky but lovable disaster energy

### Priority 2: Scene 1 Puzzles (Week 2)

**Three point-and-click puzzles from FINAL_SCENE_PROGRESSION.md**:

1. **Basement Organization**

   - Click items to arrange space, each labeled in Spanish
   - Teaches: sótano, caja, habitación, organización

2. **WiFi Hunt**

   - Decode daily Spanish password by matching words to pictures
   - Teaches: wifi, contraseña, necesito, dónde está

3. **Sticky Note Mystery**
   - Arrange Spanish notes to reveal encouraging messages
   - Teaches: nota, mensaje, perdido, confundido

### Priority 3: Spanish Learning Integration (Week 3)

**From COMPLETE_GAME_DESIGN.md learning mechanics**:

- Spanish words appear with English subtitles that fade over time
- Objects become clickable with Spanish audio pronunciation
- Simple dialogue choices between Spanish greetings
- Vocabulary mastery levels (Unknown → Learning → Confident → Mastered)

### Priority 4: Absurd Moment Implementation (Week 4)

**Scene 1's key absurd moment**:

- Netflix account changes to Spanish and seems to know Dave's life story
- Shows recommendations that predict his future
- El Espejo (mirror character) introduction through technology

---

## 🎮 SCENE 1 VOCABULARY (23 Words Ready)

**From scene_1_basement.json - Basic Survival (8 words):**

- hello → hola
- please → por favor
- thank you → gracias
- help → ayuda
- I need → necesito
- I have → tengo
- where is → dónde está
- I don't understand → no entiendo

**Dave's Chaos (7 words):**

- basement → sótano
- room → habitación
- problem → problema
- lost → perdido
- confused → confundido
- desperate → desesperado
- chaos → caos

**Essential Questions (4 words):**

- what → qué
- where → dónde
- how → cómo
- who → quién

**Basement Items (4 words):**

- box → caja
- note → nota
- wifi → wifi
- password → contraseña

---

## 🐛 LESSONS LEARNED (Troubleshooting Reference)

### ESC Script Syntax

**Problem**: Game crashed with "missing required event: 'init'"  
**Solution**: ESC commands must use function format: `print("text")` not `print "text"`

### Global IDs Required

**Problem**: Errors about missing global_ids  
**Solution**: All ESCRoom, ESCItem, ESCPlayer nodes MUST have unique `global_id` property set

### ESCLocation Script

**Problem**: "Script inherits from Area2D, can't assign to Marker2D"  
**Solution**: ESCLocation extends Marker2D (check .gd file), use correct UID reference

### Camera Limits

**Problem**: Nothing visible on screen  
**Solution**: Set camera_limits on ESCRoom: `[Rect2(0, 0, 1920, 1080)]`

### Background Size

**Problem**: Background only 40x40 pixels  
**Solution**: ESCBackground TextureRect should be 1920x1080 to match camera limits

---

## 📞 DEVELOPMENT RESOURCES

### Key Documentation

- **COMPLETE_GAME_DESIGN.md**: Full 18-scene game design
- **FINAL_CHARACTER_GUIDE.md**: All 8 characters with motivations and arcs
- **FINAL_SCENE_PROGRESSION.md**: Scene-by-scene detailed progression
- **VOCABULARY_REFERENCE.md**: 500 Spanish words organized by scene
- **DEVELOPMENT_ROADMAP.md**: 12-18 month development timeline

### Technical Setup

- **Godot Version**: 4.4.1 stable
- **Engine**: Godot with Escoria point-and-click framework
- **Art Style**: Hand-drawn 2D (Monkey Island/Grim Fandango inspired)
- **Target Platform**: Desktop (Windows, Mac, Linux)

---

## ✨ SUCCESS METRICS

**Foundation Phase**: ✅ COMPLETE

- Escoria framework operational
- Scene 1 structure in place
- Spanish Learning Manager working
- Visual placeholders functional
- No critical errors

**Next Phase: Scene 1 Vertical Slice**

- [ ] Dave character art complete
- [ ] Three puzzles fully implemented
- [ ] 23 Spanish words taught through context
- [ ] Absurd moment (Netflix) functional
- [ ] Scene 1 showable as demo

**Ultimate Goal**:
Complete Scene 1 as a vertical slice demonstrating:

- Point-and-click adventure gameplay
- Spanish learning through story
- Character personality through art/dialogue
- Absurdist humor + philosophical depth
- Full experience from start to puzzle completion

---

**Last Updated**: After successful Escoria integration and Scene 1 foundation completion  
**Current Focus**: Ready to build Scene 1 content (art, puzzles, Spanish integration)  
**Status**: 🎉 Foundation complete - Time to build the real game!
