extends CharacterBody2D
# Player movement script for Spanish learning adventure game
# This script handles 8-directional movement with WASD/Arrow keys
# Coming from React: Think of this like a component with state (velocity) and lifecycle methods

# Constants - like const in JavaScript, but Godot uses const keyword
const SPEED = 300.0  # pixels per second - our movement speed

# This is like a React component's state - it persists between frames
var is_moving = false
var was_moving_last_frame = false

# _ready() is like componentDidMount() in React - called once when node enters scene
func _ready():
	print("Player ready! Use WASD or Arrow keys to move")

# _physics_process() is like a game loop - called every frame (60fps by default)
# Think of it like a useEffect with no dependencies that runs constantly
func _physics_process(delta):
	# Get input direction - this creates a Vector2 (like {x: 0, y: 0} in JS)
	var input_direction = get_input_direction()
	
	# Update velocity based on input (velocity is built into CharacterBody2D)
	# This is like setting state in React, but it happens every frame
	velocity = input_direction * SPEED
	
	# Check if we just started moving (for debug message)
	is_moving = velocity.length() > 0
	if is_moving and not was_moving_last_frame:
		print("Player started moving! Direction: ", input_direction)
	
	# Move the character using Godot's built-in physics
	# This is the magic that handles collisions and smooth movement
	move_and_slide()
	
	# Remember movement state for next frame
	was_moving_last_frame = is_moving

# Helper function to get input direction
# This combines all input into a single Vector2 direction
func get_input_direction() -> Vector2:
	var direction = Vector2.ZERO  # Start with no movement
	
	# Check horizontal input (left/right)
	# Input.is_action_pressed() is like checking if a key is held down
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("move_right"):
		direction.x += 1
	
	# Check vertical input (up/down)
	# Note: In Godot, Y increases downward (opposite of typical math)
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("move_down"):
		direction.y += 1
	
	# Normalize for diagonal movement
	# This ensures diagonal movement isn't faster than cardinal movement
	# Like: if moving diagonally, speed stays 300 instead of ~424
	return direction.normalized()
