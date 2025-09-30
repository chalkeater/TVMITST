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
	
	# Connect to learning events
	if SpanishLearningManager:
		SpanishLearningManager.word_learned.connect(_on_word_learned)

# Called when player learns a new Spanish word
func _on_word_learned(spanish_word: String, english_word: String):
	print("Dave learned: ", english_word, " = ", spanish_word)
	
	# Special reactions for key words
	match english_word:
		"help":
			# Dave realizes he needs help - stress decreases slightly
			SpanishLearningManager.update_emotional_state(-0.1, "accepting need for help")
		"I don't understand":
			# Dave accepts confusion - breakthrough moment
			SpanishLearningManager.trigger_acceptance_moment()
		"basement":
			# Dave accepts his situation
			SpanishLearningManager.update_emotional_state(-0.05, "accepting current reality")

# Called when Dave interacts with sticky notes
func discover_sticky_note(note_text: String, spanish_word: String):
	sticky_notes_found += 1
	print("Found sticky note: ", note_text)
	
	# Learn the word from the note
	SpanishLearningManager.learn_word(spanish_word, "sticky note discovery")
	
	# Achievement for finding all notes
	if sticky_notes_found >= 5:
		print("Dave found all the mysterious sticky notes!")
		SpanishLearningManager.update_emotional_state(-0.1, "pattern recognition")

# WiFi password puzzle completion
func solve_wifi_password():
	if not wifi_password_solved:
		wifi_password_solved = true
		print("WiFi connected! Dave can access the outside world again.")
		
		# Learn multiple words from this puzzle
		SpanishLearningManager.learn_word("wifi", "technology puzzle")
		SpanishLearningManager.learn_word("password", "technology puzzle")
		SpanishLearningManager.update_emotional_state(-0.2, "solving practical problem")

# Organization mini-game
func organize_box(box_name: String):
	boxes_organized += 1
	print("Organized box: ", box_name)
	
	# Learn vocabulary from organizing
	SpanishLearningManager.learn_word("box", "organization activity")
	
	if boxes_organized >= 3:
		print("Dave organized the basement! Old habits die hard.")
		SpanishLearningManager.update_emotional_state(0.1, "falling back into control patterns")

# Netflix account mystery
func netflix_language_change():
	print("Netflix account mysteriously changed to Spanish!")
	print("Shows seem to know Dave's life story...")
	
	# This is where the absurdity begins
	SpanishLearningManager.learn_word("confused", "Netflix mystery")
	SpanishLearningManager.update_emotional_state(0.15, "technology rebellion begins")

# Scene completion check
func check_scene_completion():
	var stats = SpanishLearningManager.get_learning_stats()
	
	if stats.learned_words >= 15:  # Learned most of Scene 1 vocabulary
		print("Scene 1 nearly complete! Dave is starting to pick up Spanish.")
		# Unlock transition to Scene 2
		return true
	
	return false
