extends Area2D
class_name NPC
# NPC - Non-Player Character for story interactions
# This shows how to create interactive story characters

# Character properties
@export var character_name: String = "Carlos"
@export var dialogue_sequence: String = "opening"  # Which story sequence to play
@export var can_interact: bool = true

# Visual and interaction components
var sprite_node: Sprite2D
var interaction_prompt: Label
var collision_shape: CollisionShape2D

# Signals
signal interaction_started(npc_name)
signal interaction_ended

func _ready():
	# Set up interaction detection
	input_event.connect(_on_input_event)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	
	# Create visual representation
	setup_npc_visuals()
	
	print("NPC ", character_name, " ready for interaction")

func setup_npc_visuals():
	# Create sprite (placeholder colored rectangle for now)
	sprite_node = Sprite2D.new()
	# We'll replace this with actual character art later
	var texture = ImageTexture.new()
	var image = Image.create(64, 96, false, Image.FORMAT_RGB8)
	image.fill(Color.BLUE)  # Blue rectangle for now
	texture.set_image(image)
	sprite_node.texture = texture
	add_child(sprite_node)
	
	# Create interaction prompt
	interaction_prompt = Label.new()
	interaction_prompt.text = "Click to talk"
	interaction_prompt.position = Vector2(-40, -120)
	interaction_prompt.size = Vector2(80, 20)
	interaction_prompt.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	interaction_prompt.visible = false  # Hidden by default
	add_child(interaction_prompt)
	
	# Create collision shape for interaction
	collision_shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = Vector2(64, 96)
	collision_shape.shape = rect_shape
	add_child(collision_shape)

# Handle click interactions
func _on_input_event(_viewport, event, _shape_idx):
	if not can_interact:
		return
		
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		start_interaction()

# Show interaction prompt on hover
func _on_mouse_entered():
	if can_interact and interaction_prompt:
		interaction_prompt.visible = true

# Hide interaction prompt when not hovering
func _on_mouse_exited():
	if interaction_prompt:
		interaction_prompt.visible = false

# Start dialogue interaction
func start_interaction():
	if not can_interact:
		return
	
	interaction_started.emit(character_name)
	
	# If dialogue is already active, advance to next line
	if DialogueManager.is_dialogue_active:
		DialogueManager.next_line()
		return
	
	# Get the appropriate dialogue sequence
	var dialogue_data = get_dialogue_sequence()
	
	# Start dialogue through DialogueManager
	if DialogueManager:
		DialogueManager.start_dialogue(dialogue_data, character_name)
		DialogueManager.dialogue_finished.connect(_on_dialogue_finished)

# Get dialogue data based on story progress and character
func get_dialogue_sequence() -> Array:
	match dialogue_sequence:
		"opening":
			return StoryData.get_opening_sequence()
		"house_tour":
			return StoryData.get_house_interaction()
		"family_meeting":
			return StoryData.get_family_meeting()
		"mystery":
			return StoryData.get_mystery_sequence()
		_:
			# Default dialogue if sequence not found
			return [
				{
					"character": character_name,
					"text": "Hello! I don't have much to say right now.",
					"teaches_word": null
				}
			]

# Called when dialogue ends
func _on_dialogue_finished():
	interaction_ended.emit()
	if DialogueManager.dialogue_finished.is_connected(_on_dialogue_finished):
		DialogueManager.dialogue_finished.disconnect(_on_dialogue_finished)

# Enable/disable interaction
func set_can_interact(enabled: bool):
	can_interact = enabled
	if interaction_prompt:
		interaction_prompt.visible = false

# Change dialogue sequence (for story progression)
func set_dialogue_sequence(new_sequence: String):
	dialogue_sequence = new_sequence
