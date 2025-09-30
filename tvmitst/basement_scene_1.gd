@tool
extends ESCRoom
# Scene 1: "La Llegada al Sótano" (Arrival at the Basement)
# Dave's rock bottom moment where Spanish mysteriously starts appearing

# Scene-specific variables
var wifi_password_solved: bool = false
var boxes_organized: int = 0
var sticky_notes_found: int = 0

func _ready():
	super._ready()
	print("Scene 1: Basement loaded - Dave's beautiful disaster begins")
	
	# Initialize Spanish learning for this scene
	if SpanishLearningManager:
		SpanishLearningManager.initialize_scene_vocabulary(1)
		SpanishLearningManager.update_emotional_state(0.3, "arriving at rock bottom")
	
	# Connect ESCItem signals for interactions
	setup_interactions()

func setup_interactions():
	# Connect the ESCItem nodes to handle clicks
	var sticky_note = get_node("StickyNote1")
	var wifi_router = get_node("WiFiRouter") 
	var storage_box = get_node("StorageBox")
	
	if sticky_note and sticky_note.has_signal("input_event"):
		sticky_note.input_event.connect(_on_sticky_note_clicked)
	if wifi_router and wifi_router.has_signal("input_event"):
		wifi_router.input_event.connect(_on_wifi_router_clicked)
	if storage_box and storage_box.has_signal("input_event"):
		storage_box.input_event.connect(_on_storage_box_clicked)

func _on_sticky_note_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		discover_sticky_note("¡Hola! Welcome to chaos", "hello")

func _on_wifi_router_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("WiFi router clicked - password needed!")
		if SpanishLearningManager:
			SpanishLearningManager.learn_word("wifi", "technology puzzle")

func _on_storage_box_clicked(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Storage box clicked - time to organize!")
		if SpanishLearningManager:
			SpanishLearningManager.learn_word("box", "organization activity")

# Called when Dave interacts with sticky notes
func discover_sticky_note(note_text: String, spanish_word: String):
	sticky_notes_found += 1
	print("Found sticky note: ", note_text)
	
	# Learn the word from the note
	if SpanishLearningManager:
		SpanishLearningManager.learn_word(spanish_word, "sticky note discovery")
