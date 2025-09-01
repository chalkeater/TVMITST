# Godot vs React: Core Concepts for Frontend Developers

## Overview
This guide helps React/JavaScript developers understand Godot's core concepts by drawing parallels to familiar web development patterns.

---

## Scene Tree vs Component Tree

### React Component Tree
```jsx
function App() {
  return (
    <div className="game-container">
      <Player position={playerPos} />
      <UI>
        <HealthBar health={playerHealth} />
        <Inventory items={items} />
      </UI>
    </div>
  );
}
```

### Godot Scene Tree
```
Main (Node2D)
├── Player (CharacterBody2D)
│   ├── Sprite2D
│   └── CollisionShape2D
└── UI (CanvasLayer)
    ├── HealthBar (Control)
    └── Inventory (Control)
```

**Key Similarities:**
- Both use hierarchical structures
- Parent-child relationships determine rendering order
- Children inherit properties from parents
- Components/Nodes can be reused across scenes

**Key Differences:**
- Godot scenes are saved as `.tscn` files (like templates)
- Godot uses specialized node types (CharacterBody2D, Area2D, etc.)
- Godot's tree is more rigid - you can't dynamically restructure as easily

---

## State Management

### React State
```jsx
const [playerHealth, setPlayerHealth] = useState(100);
const [position, setPosition] = useState({x: 0, y: 0});

// Update state
setPlayerHealth(health - damage);
setPosition({x: newX, y: newY});
```

### Godot Variables
```gdscript
# Class variables (like component state)
var player_health: int = 100
var position: Vector2 = Vector2.ZERO

# Update state
player_health -= damage
position = Vector2(new_x, new_y)
```

**Key Similarities:**
- Both maintain component/node-specific state
- State changes trigger updates
- Can pass data between components/nodes

**Key Differences:**
- Godot doesn't have automatic re-rendering like React
- You manually update visuals when state changes
- Godot has built-in types like Vector2, Color, etc.

---

## Lifecycle Methods

### React Lifecycle
```jsx
useEffect(() => {
  // Component mounted
  console.log("Component ready");
  
  return () => {
    // Component unmounting
    console.log("Component cleanup");
  };
}, []);

useEffect(() => {
  // Runs every render
  updatePosition();
});
```

### Godot Lifecycle
```gdscript
func _ready():
    # Called when node enters scene tree (like componentDidMount)
    print("Node ready")

func _exit_tree():
    # Called when node leaves scene tree (like componentWillUnmount)
    print("Node cleanup")

func _process(delta):
    # Called every frame (like useEffect with no dependencies)
    update_position()

func _physics_process(delta):
    # Called every physics frame (60 FPS by default)
    handle_movement()
```

**Key Similarities:**
- Both have setup and cleanup phases
- Both have update loops
- Both can respond to external events

**Key Differences:**
- Godot separates visual updates (`_process`) from physics (`_physics_process`)
- Godot's `delta` parameter helps with frame-rate independent movement
- No dependency arrays - you control when functions run

---

## Event Handling

### React Events
```jsx
const handleClick = (event) => {
  console.log("Button clicked");
};

const handleKeyPress = (event) => {
  if (event.key === 'w') {
    moveUp();
  }
};

return (
  <button onClick={handleClick} onKeyPress={handleKeyPress}>
    Move
  </button>
);
```

### Godot Signals
```gdscript
# Define a signal (like creating an event)
signal health_changed(new_health)
signal player_died

func _ready():
    # Connect to input events
    input_event.connect(_on_input_event)
    
    # Connect to custom signals
    health_changed.connect(_on_health_changed)

func _on_input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        print("Object clicked")

func _on_health_changed(new_health):
    print("Health is now: ", new_health)

# Emit signals (like calling an event handler)
func take_damage(amount):
    health -= amount
    health_changed.emit(health)
    if health <= 0:
        player_died.emit()
```

**Key Similarities:**
- Both use event-driven programming
- Both can pass data with events
- Both support custom events/signals

**Key Differences:**
- Godot signals are more explicit - you define them at the top
- Godot uses `connect()` method instead of props
- Godot signals can connect to any callable function

---

## Props vs Export Variables

### React Props
```jsx
function Player({ speed, health, onHealthChange }) {
  return (
    <div className="player">
      Speed: {speed}, Health: {health}
    </div>
  );
}

// Usage
<Player speed={300} health={100} onHealthChange={handleHealthChange} />
```

### Godot Export Variables
```gdscript
extends CharacterBody2D

# Export variables appear in Godot's inspector (like props)
@export var speed: float = 300.0
@export var max_health: int = 100
@export var player_name: String = "Hero"

func _ready():
    print("Player speed: ", speed)
    print("Player health: ", max_health)
    print("Player name: ", player_name)
```

**Key Similarities:**
- Both allow customization from parent
- Both provide default values
- Both enable reusable components/nodes

**Key Differences:**
- Godot exports are set in the editor, not in code
- Godot exports persist when you save the scene
- You can't pass functions as exports (use signals instead)

---

## Data Flow

### React Data Flow
```jsx
// Parent component
function Game() {
  const [gameState, setGameState] = useState({
    score: 0,
    level: 1
  });

  return (
    <div>
      <Player onScoreChange={(points) => 
        setGameState(prev => ({...prev, score: prev.score + points}))
      } />
      <UI score={gameState.score} level={gameState.level} />
    </div>
  );
}
```

### Godot Data Flow
```gdscript
# GameManager.gd (Singleton/Autoload)
extends Node

var game_state = {
    "score": 0,
    "level": 1
}

signal score_changed(new_score)

func add_score(points):
    game_state.score += points
    score_changed.emit(game_state.score)

# Player.gd
extends CharacterBody2D

func collect_coin():
    GameManager.add_score(10)

# UI.gd
extends Control

func _ready():
    GameManager.score_changed.connect(_on_score_changed)

func _on_score_changed(new_score):
    $ScoreLabel.text = "Score: " + str(new_score)
```

**Key Similarities:**
- Both use unidirectional data flow
- Both can have global state management
- Both use events/signals for communication

**Key Differences:**
- Godot uses Singletons (Autoloads) for global state
- Godot doesn't have automatic UI updates - you manually update labels/UI
- Godot's node references use `$` syntax (like jQuery)

---

## Styling vs Theming

### React Styling
```jsx
const playerStyle = {
  width: '32px',
  height: '32px',
  backgroundColor: 'blue',
  position: 'absolute',
  left: `${position.x}px`,
  top: `${position.y}px`
};

return <div style={playerStyle} className="player" />;
```

### Godot Theming
```gdscript
# In script
func _ready():
    # Set node properties
    $Sprite2D.texture = preload("res://assets/player.png")
    $Sprite2D.scale = Vector2(2, 2)
    position = Vector2(100, 100)
    
    # Modify UI theme
    $UI/Button.add_theme_color_override("font_color", Color.RED)
```

**Key Similarities:**
- Both control visual appearance
- Both can be modified at runtime
- Both support reusable styling systems

**Key Differences:**
- Godot uses built-in properties instead of CSS
- Godot themes are resource files you can save and reuse
- Godot positioning uses Vector2 coordinates, not CSS units

---

## Next Steps

1. **Read**: `02_gdscript_for_js_developers.md` - Learn GDScript syntax
2. **Read**: `03_node_types_explained.md` - Understand different node types
3. **Practice**: Try modifying the Player.gd script we created
4. **Experiment**: Create a simple learning object in Godot's editor

## Key Takeaways

- **Godot is more explicit** - you define everything clearly
- **Manual updates** - you control when things change
- **Scene-based architecture** - think of scenes as reusable components
- **Signals are powerful** - use them for all communication
- **The editor is your friend** - many things are easier to do visually

Remember: Coming from React, you're already thinking in components and state management. Godot just uses different syntax and patterns to achieve the same goals!

