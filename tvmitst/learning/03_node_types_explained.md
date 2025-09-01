# Godot Node Types Explained for React Developers

## Overview

Godot uses specialized node types for different game functionality. Think of nodes like specialized React components - each type is optimized for specific tasks.

---

## Core Node Types

### Node (Base Class)

**React Equivalent:** `<div>` - basic container

```gdscript
extends Node
# Basic node - can have children, receives lifecycle events
# Use for: Game managers, data containers, logic controllers
```

**When to Use:**

- Singletons/managers (GameManager, AudioManager)
- Pure logic nodes (no visual representation)
- Organizing other nodes

---

### Node2D (2D Positioning)

**React Equivalent:** `<div>` with CSS positioning

```gdscript
extends Node2D
# Has position, rotation, scale in 2D space
# Use for: Anything that needs 2D positioning
```

**Properties:**

- `position: Vector2` - X, Y coordinates
- `rotation: float` - Rotation in radians
- `scale: Vector2` - Scale multiplier
- `z_index: int` - Rendering order

**When to Use:**

- Root nodes for 2D scenes
- Organizing positioned elements
- Empty game objects that need transforms

---

## Visual Nodes

### Sprite2D (Images)

**React Equivalent:** `<img>` tag

```gdscript
extends Sprite2D
# Displays a single image/texture
# Use for: Static images, character sprites, backgrounds
```

**Key Properties:**

- `texture: Texture2D` - The image to display
- `region_enabled: bool` - Use only part of texture
- `flip_h/flip_v: bool` - Mirror the sprite

**Example Usage:**

```gdscript
func _ready():
    texture = preload("res://assets/player.png")
    scale = Vector2(2, 2)  # Make it 2x bigger
```

### AnimatedSprite2D (Animated Images)

**React Equivalent:** CSS animations or GIF

```gdscript
extends AnimatedSprite2D
# Plays sprite animations (like sprite sheets)
# Use for: Character animations, animated objects
```

**Key Methods:**

- `play("animation_name")` - Start an animation
- `stop()` - Stop current animation
- `is_playing()` - Check if animating

---

## Physics Nodes

### CharacterBody2D (Player/NPC Movement)

**React Equivalent:** Interactive element with physics

```gdscript
extends CharacterBody2D
# For characters that need movement and collision
# Use for: Players, NPCs, moving platforms
```

**Built-in Properties:**

- `velocity: Vector2` - Current movement speed/direction
- `move_and_slide()` - Handles movement and collisions

**Perfect For:**

- Player characters
- NPCs that walk around
- Moving platforms

### RigidBody2D (Physics Objects)

**React Equivalent:** Physics-simulated element

```gdscript
extends RigidBody2D
# Realistic physics simulation
# Use for: Falling objects, projectiles, physics puzzles
```

**When to Use:**

- Objects affected by gravity
- Bouncing balls, falling rocks
- Physics-based puzzles

### Area2D (Trigger Zones)

**React Equivalent:** Invisible clickable area

```gdscript
extends Area2D
# Detects when other objects enter/exit
# Use for: Collectibles, triggers, interactive zones
```

**Key Signals:**

- `body_entered(body)` - Something entered the area
- `body_exited(body)` - Something left the area
- `input_event()` - Mouse clicks on the area

**Perfect For:**

- Collectible items (coins, power-ups)
- Door triggers
- Interactive learning objects

---

## UI Nodes

### Control (Base UI)

**React Equivalent:** `<div>` with layout

```gdscript
extends Control
# Base class for all UI elements
# Use for: Custom UI components, containers
```

### Button

**React Equivalent:** `<button>`

```gdscript
extends Button
# Clickable button
# Use for: Menu buttons, interaction prompts
```

### Label

**React Equivalent:** `<span>` or `<p>`

```gdscript
extends Label
# Displays text
# Use for: UI text, dialogue, scores
```

---

## Collision and Detection

### CollisionShape2D

**React Equivalent:** Invisible hitbox

```gdscript
# Defines the collision area for physics nodes
# Must be child of CharacterBody2D, RigidBody2D, or Area2D
```

**Common Shapes:**

- `RectangleShape2D` - Square/rectangle
- `CircleShape2D` - Circle
- `CapsuleShape2D` - Pill shape (good for characters)

---

## Node Combinations for Common Game Objects

### Player Character

```
Player (CharacterBody2D)
├── Sprite2D (visual representation)
├── CollisionShape2D (physics collision)
└── Area2D (interaction detection)
    └── CollisionShape2D (interaction area)
```

### Learning Object

```
LearnableObject (Area2D)
├── Sprite2D (visual icon)
├── CollisionShape2D (click detection)
└── Label (word display)
```

### UI Menu

```
MainMenu (Control)
├── StartButton (Button)
├── SettingsButton (Button)
├── QuitButton (Button)
└── TitleLabel (Label)
```

---

## Choosing the Right Node Type

### For Movement:

- **Player/NPC that walks:** `CharacterBody2D`
- **Physics object:** `RigidBody2D`
- **Static positioned object:** `Node2D`

### For Interaction:

- **Clickable/triggerable:** `Area2D`
- **UI button:** `Button`
- **Solid obstacle:** `StaticBody2D`

### For Visuals:

- **Static image:** `Sprite2D`
- **Animation:** `AnimatedSprite2D`
- **Text:** `Label`
- **UI element:** `Control` (or specific UI nodes)

---

## React Component vs Godot Node Comparison

| React Pattern         | Godot Equivalent   | Use Case                   |
| --------------------- | ------------------ | -------------------------- |
| `<div>`               | `Node2D`           | Container with positioning |
| `<img>`               | `Sprite2D`         | Display images             |
| `<button onClick={}>` | `Button` + signal  | Clickable UI               |
| `<span>`              | `Label`            | Display text               |
| Interactive element   | `Area2D`           | Custom interactions        |
| Animated element      | `AnimatedSprite2D` | Sprite animations          |
| Physics object        | `RigidBody2D`      | Realistic physics          |
| Character controller  | `CharacterBody2D`  | Player movement            |

---

## Best Practices

### 1. Use Specific Node Types

```gdscript
# Good - specific to purpose
extends CharacterBody2D  # For player movement

# Avoid - too generic
extends Node2D  # Could be anything
```

### 2. Organize with Empty Nodes

```
Main (Node2D)
├── Players (Node2D)  # Container for all players
│   └── Player (CharacterBody2D)
├── UI (CanvasLayer)   # Container for UI
│   └── HUD (Control)
└── World (Node2D)     # Container for world objects
    └── Objects (Node2D)
```

### 3. Separate Concerns

```gdscript
# Good - each node has one responsibility
Player (CharacterBody2D)  # Movement
├── Visuals (Node2D)      # All visual stuff
│   ├── Sprite2D          # Character image
│   └── HealthBar (Control) # Health display
└── Interactions (Node2D)  # All interaction stuff
    └── InteractionArea (Area2D) # What player can interact with
```

---

## Common Mistakes from React Developers

### 1. Using Node Instead of Node2D

```gdscript
# Wrong - Node has no position
extends Node
func _ready():
    position = Vector2(100, 100)  # Error! Node has no position

# Right - Node2D has positioning
extends Node2D
func _ready():
    position = Vector2(100, 100)  # Works!
```

### 2. Forgetting CollisionShape2D

```gdscript
# Wrong - Area2D without collision shape won't detect anything
extends Area2D
# Missing CollisionShape2D child!

# Right - Area2D with collision shape
extends Area2D
func _ready():
    var collision = CollisionShape2D.new()
    var shape = RectangleShape2D.new()
    collision.shape = shape
    add_child(collision)
```

### 3. Using Wrong Node for UI

```gdscript
# Wrong - Node2D for UI (doesn't scale properly)
extends Node2D  # UI should use Control nodes

# Right - Control for UI
extends Control  # Proper UI node
```

---

## Next Steps

1. **Experiment**: Create different node types in Godot editor
2. **Practice**: Build the Player scene using CharacterBody2D
3. **Read**: `04_signals_and_communication.md` - Learn how nodes talk to each other
4. **Build**: Create a simple scene with multiple node types

## Key Takeaways

- **Each node type has a purpose** - choose the right tool for the job
- **Composition over inheritance** - combine simple nodes for complex behavior
- **Physics nodes need CollisionShape2D** - don't forget collision shapes
- **UI uses Control nodes** - separate from game world nodes
- **Node2D for positioning** - anything that needs 2D coordinates

Understanding node types is crucial for effective Godot development. Each type is optimized for specific game development tasks, making your code more efficient and easier to understand!

