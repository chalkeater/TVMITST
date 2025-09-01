# GDScript for JavaScript Developers

## Overview
GDScript is Godot's built-in scripting language, designed specifically for game development. This guide shows JavaScript developers how to translate their knowledge to GDScript.

---

## Basic Syntax Comparison

### Variables

**JavaScript:**
```javascript
// Variable declarations
let playerName = "Hero";
const SPEED = 300;
var health = 100;

// Types are dynamic
let value = 42;
value = "now a string";
```

**GDScript:**
```gdscript
# Variable declarations
var player_name = "Hero"
const SPEED = 300
var health = 100

# Optional type hints (recommended)
var player_name: String = "Hero"
const SPEED: float = 300.0
var health: int = 100

# Types can be inferred
var value = 42  # int
var message = "Hello"  # String
```

**Key Differences:**
- GDScript uses `snake_case` instead of `camelCase`
- Type hints are optional but recommended
- No `let` keyword - just `var` and `const`

---

### Functions

**JavaScript:**
```javascript
// Function declaration
function calculateDamage(baseDamage, multiplier = 1.0) {
    return baseDamage * multiplier;
}

// Arrow function
const heal = (amount) => {
    health += amount;
    return health;
};

// Method in class
class Player {
    takeDamage(amount) {
        this.health -= amount;
    }
}
```

**GDScript:**
```gdscript
# Function declaration
func calculate_damage(base_damage: int, multiplier: float = 1.0) -> int:
    return base_damage * multiplier

# All functions use 'func' keyword
func heal(amount: int) -> int:
    health += amount
    return health

# Method in class (extends creates a class)
extends CharacterBody2D

func take_damage(amount: int) -> void:
    health -= amount
```

**Key Differences:**
- All functions use `func` keyword
- Return type comes after `->` 
- Use `void` for functions that don't return anything
- No arrow functions - all functions are declared the same way

---

### Control Flow

**JavaScript:**
```javascript
// If statements
if (health <= 0) {
    console.log("Game Over");
} else if (health < 20) {
    console.log("Low health!");
} else {
    console.log("Healthy");
}

// Switch statement
switch (playerState) {
    case "idle":
        handleIdle();
        break;
    case "moving":
        handleMovement();
        break;
    default:
        console.log("Unknown state");
}

// Loops
for (let i = 0; i < enemies.length; i++) {
    enemies[i].update();
}

enemies.forEach(enemy => enemy.update());
```

**GDScript:**
```gdscript
# If statements (no parentheses needed)
if health <= 0:
    print("Game Over")
elif health < 20:
    print("Low health!")
else:
    print("Healthy")

# Match statement (like switch)
match player_state:
    "idle":
        handle_idle()
    "moving":
        handle_movement()
    _:  # default case
        print("Unknown state")

# Loops
for i in range(enemies.size()):
    enemies[i].update()

# For-each loop
for enemy in enemies:
    enemy.update()
```

**Key Differences:**
- No parentheses around conditions
- `elif` instead of `else if`
- `match` instead of `switch`
- `_` is the default case in match
- `range()` function for numeric loops

---

### Arrays and Objects

**JavaScript:**
```javascript
// Arrays
const weapons = ["sword", "bow", "staff"];
weapons.push("axe");
console.log(weapons.length);

// Objects
const player = {
    name: "Hero",
    level: 5,
    inventory: ["potion", "key"]
};

player.experience = 1500;
console.log(player.name);
```

**GDScript:**
```gdscript
# Arrays
var weapons = ["sword", "bow", "staff"]
weapons.append("axe")  # push() becomes append()
print(weapons.size())  # length becomes size()

# Dictionaries (like objects)
var player = {
    "name": "Hero",
    "level": 5,
    "inventory": ["potion", "key"]
}

player["experience"] = 1500  # bracket notation
player.experience = 1500     # dot notation also works
print(player.name)
```

**Key Differences:**
- `append()` instead of `push()`
- `size()` instead of `length`
- Dictionaries use quotes around keys
- Both bracket and dot notation work for dictionaries

---

### Classes and Inheritance

**JavaScript:**
```javascript
class GameObject {
    constructor(x, y) {
        this.position = {x, y};
        this.active = true;
    }
    
    update() {
        console.log("Updating object");
    }
}

class Player extends GameObject {
    constructor(x, y, health) {
        super(x, y);
        this.health = health;
    }
    
    update() {
        super.update();
        this.handleInput();
    }
}
```

**GDScript:**
```gdscript
# Base class (GameObject.gd)
extends Node2D
class_name GameObject

var position: Vector2
var active: bool = true

func _init(x: float, y: float):
    position = Vector2(x, y)

func update():
    print("Updating object")

# Derived class (Player.gd)
extends GameObject
class_name Player

var health: int

func _init(x: float, y: float, health_value: int):
    super(x, y)  # Call parent constructor
    health = health_value

func update():
    super.update()  # Call parent method
    handle_input()
```

**Key Differences:**
- `extends` defines inheritance at the top of the file
- `class_name` makes the class available globally
- `_init()` is the constructor
- `super()` calls parent methods

---

### Built-in Types

**JavaScript:**
```javascript
// Basic types
const position = {x: 100, y: 200};
const color = "rgb(255, 0, 0)";
const isActive = true;
```

**GDScript:**
```gdscript
# Godot has rich built-in types
var position = Vector2(100, 200)
var color = Color.RED  # or Color(1.0, 0.0, 0.0)
var is_active = true

# More Godot types
var area = Rect2(0, 0, 64, 64)  # x, y, width, height
var transform = Transform2D()
var node_path = NodePath("Player/Sprite2D")
```

**Key Differences:**
- Godot has specialized types for game development
- Vector2, Color, Rect2, etc. have built-in methods
- These types are optimized for performance

---

### Error Handling

**JavaScript:**
```javascript
try {
    const data = JSON.parse(jsonString);
    processData(data);
} catch (error) {
    console.error("Parse error:", error);
} finally {
    cleanup();
}
```

**GDScript:**
```gdscript
# GDScript doesn't have try/catch
# Instead, check return values and use assertions

var file = FileAccess.open("save.dat", FileAccess.READ)
if file == null:
    print("Error: Could not open file")
    return

var data = file.get_as_text()
file.close()

# Use assertions for debugging
assert(health > 0, "Health must be positive")

# Check if nodes exist before using them
if has_node("Player"):
    $Player.take_damage(10)
```

**Key Differences:**
- No try/catch - check return values instead
- Use `assert()` for debugging
- Always check if resources/nodes exist before using

---

### Async/Promises vs Signals

**JavaScript:**
```javascript
// Promises
async function loadData() {
    try {
        const response = await fetch('/api/data');
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Load failed:', error);
    }
}

// Event listeners
button.addEventListener('click', handleClick);
```

**GDScript:**
```gdscript
# Signals (Godot's event system)
signal data_loaded(data)
signal loading_failed(error)

func load_data():
    var http_request = HTTPRequest.new()
    add_child(http_request)
    http_request.request_completed.connect(_on_request_completed)
    http_request.request("https://api.example.com/data")

func _on_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
    if response_code == 200:
        var data = JSON.parse_string(body.get_string_from_utf8())
        data_loaded.emit(data)
    else:
        loading_failed.emit("HTTP Error: " + str(response_code))

# Connect to signals
func _ready():
    data_loaded.connect(_on_data_loaded)
    loading_failed.connect(_on_loading_failed)
```

**Key Differences:**
- Signals replace promises and event listeners
- More explicit - you define signals at the top
- Connect signals in `_ready()` function

---

## Common Patterns

### Singleton Pattern

**JavaScript:**
```javascript
class GameManager {
    static instance = null;
    
    static getInstance() {
        if (!GameManager.instance) {
            GameManager.instance = new GameManager();
        }
        return GameManager.instance;
    }
}
```

**GDScript:**
```gdscript
# Create GameManager.gd and add it as AutoLoad in project settings
extends Node

var score: int = 0
var level: int = 1

func add_score(points: int):
    score += points

# Access from anywhere:
# GameManager.add_score(10)
```

### Observer Pattern

**JavaScript:**
```javascript
class EventEmitter {
    constructor() {
        this.listeners = {};
    }
    
    on(event, callback) {
        if (!this.listeners[event]) {
            this.listeners[event] = [];
        }
        this.listeners[event].push(callback);
    }
    
    emit(event, data) {
        if (this.listeners[event]) {
            this.listeners[event].forEach(callback => callback(data));
        }
    }
}
```

**GDScript:**
```gdscript
# Built into Godot with signals!
extends Node

signal health_changed(new_health)
signal player_died

func take_damage(amount: int):
    health -= amount
    health_changed.emit(health)
    if health <= 0:
        player_died.emit()

# In another script:
func _ready():
    player.health_changed.connect(_on_health_changed)
    player.player_died.connect(_on_player_died)
```

---

## Best Practices

### 1. Use Type Hints
```gdscript
# Good
func calculate_damage(base: int, multiplier: float) -> int:
    return int(base * multiplier)

# Avoid
func calculate_damage(base, multiplier):
    return base * multiplier
```

### 2. Use snake_case
```gdscript
# Good
var player_health: int = 100
func get_player_position() -> Vector2:

# Avoid
var playerHealth: int = 100
func getPlayerPosition() -> Vector2:
```

### 3. Prefer Composition over Inheritance
```gdscript
# Good - use components
extends CharacterBody2D

var health_component: HealthComponent
var movement_component: MovementComponent

# Better than deep inheritance chains
```

### 4. Use Signals for Communication
```gdscript
# Good - loose coupling
signal coin_collected(value)

# Avoid - tight coupling
func collect_coin():
    GameManager.add_score(10)  # Direct dependency
```

---

## Next Steps

1. **Practice**: Convert a simple JavaScript function to GDScript
2. **Read**: `03_node_types_explained.md` - Learn about Godot's node system
3. **Experiment**: Try the GDScript examples in Godot's script editor
4. **Build**: Create a simple script that uses signals and type hints

## Key Takeaways

- **GDScript is Python-like** - indentation matters, no braces
- **Type hints help** - use them for better code and performance
- **Signals are powerful** - they replace many JavaScript patterns
- **Built-in types are rich** - Vector2, Color, etc. have many useful methods
- **No async/await** - use signals and callbacks instead

The transition from JavaScript to GDScript is smoother than you might expect. The concepts are similar, just with different syntax and some game-specific features!

