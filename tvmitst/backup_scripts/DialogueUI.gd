extends Control
class_name DialogueUI
# DialogueUI - Beautiful in-game dialogue interface
# Inspired by classic adventure games like Monkey Island

# UI Components
var dialogue_panel: Panel
var character_name_label: Label
var dialogue_text_label: RichTextLabel
var next_button: Button
var choice_container: VBoxContainer
var choice_buttons: Array[Button] = []

# Visual styling
var panel_color = Color(0.1, 0.1, 0.2, 0.9)  # Dark blue with transparency
var text_color = Color.WHITE
var name_color = Color.YELLOW

func _ready():
	# Set up the dialogue UI
	setup_ui_components()
	
	# Connect to DialogueManager signals
	if DialogueManager:
		DialogueManager.dialogue_started.connect(_on_dialogue_started)
		DialogueManager.dialogue_finished.connect(_on_dialogue_finished)
	
	# Start hidden
	visible = false
	print("DialogueUI ready")

func setup_ui_components():
	# Main dialogue panel (bottom of screen)
	dialogue_panel = Panel.new()
	dialogue_panel.size = Vector2(800, 200)
	dialogue_panel.position = Vector2(100, 500)  # Bottom of screen
	
	# Style the panel
	var style_box = StyleBoxFlat.new()
	style_box.bg_color = panel_color
	style_box.corner_radius_top_left = 10
	style_box.corner_radius_top_right = 10
	style_box.corner_radius_bottom_left = 10
	style_box.corner_radius_bottom_right = 10
	dialogue_panel.add_theme_stylebox_override("panel", style_box)
	add_child(dialogue_panel)
	
	# Character name label
	character_name_label = Label.new()
	character_name_label.position = Vector2(20, 10)
	character_name_label.size = Vector2(200, 30)
	character_name_label.add_theme_color_override("font_color", name_color)
	character_name_label.add_theme_font_size_override("font_size", 18)
	dialogue_panel.add_child(character_name_label)
	
	# Main dialogue text
	dialogue_text_label = RichTextLabel.new()
	dialogue_text_label.position = Vector2(20, 45)
	dialogue_text_label.size = Vector2(760, 100)
	dialogue_text_label.add_theme_color_override("default_color", text_color)
	dialogue_text_label.add_theme_font_size_override("normal_font_size", 16)
	dialogue_text_label.bbcode_enabled = true
	dialogue_text_label.fit_content = true
	dialogue_panel.add_child(dialogue_text_label)
	
	# Next button
	next_button = Button.new()
	next_button.text = "Next"
	next_button.position = Vector2(680, 155)
	next_button.size = Vector2(100, 35)
	next_button.pressed.connect(_on_next_pressed)
	dialogue_panel.add_child(next_button)
	
	# Choice container (for dialogue choices)
	choice_container = VBoxContainer.new()
	choice_container.position = Vector2(20, 155)
	choice_container.size = Vector2(640, 35)
	dialogue_panel.add_child(choice_container)

# Show dialogue UI when conversation starts
func _on_dialogue_started(character_name: String):
	visible = true
	character_name_label.text = character_name
	update_dialogue_display()

# Hide dialogue UI when conversation ends
func _on_dialogue_finished():
	visible = false
	clear_choices()

# Update the dialogue display with current line
func update_dialogue_display():
	if not DialogueManager.is_dialogue_active:
		return
	
	var current_line_data = DialogueManager.current_dialogue[DialogueManager.current_line]
	var processed_text = DialogueManager.replace_learned_words(current_line_data.text)
	
	# Check if this is a choice line
	if processed_text.contains("[Choice]"):
		show_choices(processed_text)
		next_button.visible = false
	else:
		dialogue_text_label.text = processed_text
		next_button.visible = true
		clear_choices()

# Handle Next button press
func _on_next_pressed():
	if DialogueManager and DialogueManager.is_dialogue_active:
		DialogueManager.next_line()
		update_dialogue_display()

# Show choice buttons for player decisions
func show_choices(choice_text: String):
	clear_choices()
	
	# Parse choices from text like "[Choice] Yes, I'll help! / [Choice] What do you mean?"
	var choices = choice_text.split(" / ")
	
	for i in range(choices.size()):
		var choice = choices[i].replace("[Choice] ", "").strip_edges()
		
		var choice_button = Button.new()
		choice_button.text = str(i + 1) + ". " + choice
		choice_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		choice_button.pressed.connect(_on_choice_selected.bind(i))
		
		choice_container.add_child(choice_button)
		choice_buttons.append(choice_button)
	
	# Show instruction text
	dialogue_text_label.text = "Choose your response:"

# Handle choice selection
func _on_choice_selected(choice_index: int):
	if DialogueManager:
		DialogueManager.make_choice(choice_index)
		update_dialogue_display()

# Clear all choice buttons
func clear_choices():
	for button in choice_buttons:
		button.queue_free()
	choice_buttons.clear()

# Connect to DialogueManager for automatic updates
func _on_dialogue_manager_line_changed():
	update_dialogue_display()
