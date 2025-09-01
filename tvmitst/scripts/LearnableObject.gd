extends Area2D
# LearnableObject - Interactive Spanish learning items
# Think of this like a React component that manages learning state for Spanish words

# Enums in Godot are like const objects in TypeScript
enum LearningState {
	UNKNOWN,   # Player hasn't interacted with this object yet
	LEARNING,  # Player has clicked once, word is being learned
	LEARNED    # Player has mastered this word
}

# Export variables appear in Godot's inspector (like props in React)
# These can be set per instance in the editor
@export var english_word: String = "house"
@export var spanish_word: String = "casa"
@export var gender: String = "la"  # "el" or "la"

# Internal state - like useState in React
var current_state: LearningState = LearningState.UNKNOWN
var click_count: int = 0

# Visual feedback colors (you can customize these)
var color_unknown = Color.GRAY
var color_learning = Color.YELLOW
var color_learned = Color.GREEN

# References to child nodes (like useRef in React)
var visual_node: ColorRect
var label_node: Label

func _ready():
	# Connect the input_event signal - like addEventListener in JS
	# This detects when the player clicks on this object
	input_event.connect(_on_input_event)
	
	# Get references to manually created child nodes
	if has_node("ColorRect"):
		visual_node = $ColorRect
		# Make sure ColorRect is properly positioned and sized
		visual_node.position = Vector2(-32, -32)  # Center it
		visual_node.size = Vector2(64, 64)
	else:
		print("Warning: ColorRect node not found!")
		
	if has_node("Label"):
		label_node = $Label
		# Position label in the center of the ColorRect
		label_node.position = Vector2(-30, 10)
		label_node.size = Vector2(60, 20)
		label_node.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	else:
		print("Warning: Label node not found!")
	
	# Update initial appearance
	update_visual_state()
	
	print("LearnableObject ready: ", english_word, " = ", gender, " ", spanish_word)

func setup_visuals():
	print("DEBUG: Creating ColorRect...")
	# Create a visual representation (like creating DOM elements in JS)
	visual_node = ColorRect.new()
	visual_node.size = Vector2(64, 64)
	visual_node.position = Vector2(-32, -32)  # Center the rectangle
	add_child(visual_node)
	print("DEBUG: ColorRect added as child")
	
	print("DEBUG: Creating Label...")
	# Create a label to show the word
	label_node = Label.new()
	label_node.position = Vector2(-30, 10)
	label_node.size = Vector2(60, 20)
	label_node.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	add_child(label_node)
	print("DEBUG: Label added as child")
	
	print("DEBUG: Creating CollisionShape2D...")
	# Set up collision detection (like a clickable area)
	var collision_shape = CollisionShape2D.new()
	var rectangle_shape = RectangleShape2D.new()
	rectangle_shape.size = Vector2(64, 64)
	collision_shape.shape = rectangle_shape
	add_child(collision_shape)
	print("DEBUG: CollisionShape2D added as child")

# Handle click events - like onClick in React
func _on_input_event(_viewport, event, _shape_idx):
	# Check if it's a mouse click (left button pressed)
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		advance_learning_state()

# Progress through learning states - like a state machine
func advance_learning_state():
	click_count += 1
	
	match current_state:
		LearningState.UNKNOWN:
			current_state = LearningState.LEARNING
			print("Started learning: ", english_word, " = ", gender, " ", spanish_word)
			
		LearningState.LEARNING:
			current_state = LearningState.LEARNED
			print("Learned: ", gender, " ", spanish_word, " (", english_word, ")")
			
		LearningState.LEARNED:
			# Cycle back to unknown for testing (you might want different behavior)
			current_state = LearningState.UNKNOWN
			print("Reset learning state for: ", english_word)
	
	# Update visual appearance
	update_visual_state()

# Update visual appearance based on learning state
func update_visual_state():
	if not visual_node or not label_node:
		return
	
	match current_state:
		LearningState.UNKNOWN:
			visual_node.color = color_unknown
			label_node.text = "?"
			
		LearningState.LEARNING:
			visual_node.color = color_learning
			label_node.text = english_word
			
		LearningState.LEARNED:
			visual_node.color = color_learned
			label_node.text = gender + " " + spanish_word

# Getter functions for external access (like public methods in a class)
func get_learning_state() -> LearningState:
	return current_state

func get_word_data() -> Dictionary:
	return {
		"english": english_word,
		"spanish": spanish_word,
		"gender": gender,
		"state": current_state,
		"clicks": click_count
	}
