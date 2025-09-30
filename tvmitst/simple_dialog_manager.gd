# Simple Dialog Manager for TVMITST
# Extends ESCDialogManager to provide basic dialogue functionality
extends ESCDialogManager

# Simple dialog types this manager supports
const SUPPORTED_TYPES = ["simple", "default", ""]
const SUPPORTED_CHOOSER_TYPES = ["simple", "default"]

# UI elements for displaying dialogue
var dialog_label: Label
var dialog_panel: Panel
var choice_buttons: Array[Button] = []
var dialog_container: Control

func _ready():
	super._ready()
	setup_ui()

func setup_ui():
	# Create a simple dialog UI
	dialog_container = Control.new()
	dialog_container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(dialog_container)
	
	# Dialog panel
	dialog_panel = Panel.new()
	dialog_panel.anchor_left = 0.1
	dialog_panel.anchor_right = 0.9
	dialog_panel.anchor_bottom = 1.0
	dialog_panel.anchor_top = 0.7
	dialog_panel.visible = false
	dialog_container.add_child(dialog_panel)
	
	# Dialog text label
	dialog_label = Label.new()
	dialog_label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	dialog_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	dialog_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	dialog_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dialog_label.add_theme_font_size_override("font_size", 16)
	dialog_panel.add_child(dialog_label)

# Check if this manager supports the given dialog type
func has_type(type: String) -> bool:
	return type in SUPPORTED_TYPES

# Check if this manager supports the given chooser type
func has_chooser_type(type: String) -> bool:
	return type in SUPPORTED_CHOOSER_TYPES

# Display dialog text
func say(dialog_player: Node, global_id: String, text: String, type: String, key: String):
	print("Dialog: [%s] %s" % [global_id, text])
	
	# Show the dialog
	dialog_panel.visible = true
	dialog_label.text = text
	
	# Auto-close after a delay (simple implementation)
	await get_tree().create_timer(2.0).timeout
	dialog_panel.visible = false
	
	# Emit the finished signal
	say_finished.emit()

# Handle dialog choices (basic implementation)
func choose(dialog_player: Node, dialog: ESCDialog, type: String):
	print("Dialog choices not fully implemented yet")
	# For now, just emit a default choice
	option_chosen.emit(0)

# Interrupt current dialog
func interrupt():
	dialog_panel.visible = false
