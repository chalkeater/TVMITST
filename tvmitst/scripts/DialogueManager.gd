extends Node
# DialogueManager - Global singleton for handling story and dialogue
# This manages the narrative flow and word replacement system

# Signals for dialogue events
signal dialogue_started(character_name)
signal dialogue_finished
signal word_learned(spanish_word, english_word)

# Player's vocabulary progress
var learned_words: Dictionary = {}
var story_progress: int = 0

# Current dialogue state
var current_dialogue: Array = []
var current_line: int = 0
var is_dialogue_active: bool = false
var waiting_for_choice: bool = false

# Word replacement system
var word_replacements: Dictionary = {
	# Basic greetings (First 5 words)
	"hello": "hola",
	"goodbye": "adiós", 
	"please": "por favor",
	"thank you": "gracias",
	"yes": "sí",
	
	# Essential nouns (Next 10 words)
	"house": "casa",
	"water": "agua",
	"food": "comida",
	"friend": "amigo",
	"family": "familia",
	"dog": "perro",
	"cat": "gato",
	"book": "libro",
	"door": "puerta",
	"window": "ventana",
	
	# Common verbs (Next 5 words)
	"to go": "ir",
	"to see": "ver", 
	"to have": "tener",
	"to be": "ser",
	"to want": "querer"
}

func _ready():
	print("DialogueManager ready - managing story and vocabulary")

func _input(event):
	# Handle choice selection during dialogue (keyboard only)
	if waiting_for_choice and event is InputEventKey and event.pressed:
		match event.keycode:
			KEY_1:
				make_choice(0)  # First choice
			KEY_2:
				make_choice(1)  # Second choice

# Start a dialogue sequence
func start_dialogue(dialogue_data: Array, character_name: String = ""):
	current_dialogue = dialogue_data
	current_line = 0
	is_dialogue_active = true
	dialogue_started.emit(character_name)
	show_current_line()

# Process and display current dialogue line with word replacement
func show_current_line():
	if current_line >= current_dialogue.size():
		end_dialogue()
		return
	
	var line_data = current_dialogue[current_line]
	var original_text = line_data.text
	var processed_text = replace_learned_words(original_text)
	
	# Check if this is a choice line
	if processed_text.contains("[Choice]"):
		waiting_for_choice = true
	else:
		waiting_for_choice = false
	
	# Still print to console for debugging
	print("DIALOGUE: ", processed_text)
	
	# Check if this line teaches new words
	if line_data.has("teaches_word") and line_data.teaches_word != null:
		learn_word(line_data.teaches_word)

# Replace English words with Spanish equivalents based on learning progress
func replace_learned_words(text: String) -> String:
	var result = text
	
	for english_word in learned_words.keys():
		if learned_words[english_word] == true:  # Word is learned
			var spanish_word = word_replacements.get(english_word, english_word)
			# Simple case-insensitive replacement for now
			result = result.replace(english_word.capitalize(), spanish_word.capitalize())
			result = result.replace(english_word.to_lower(), spanish_word.to_lower())
			result = result.replace(english_word.to_upper(), spanish_word.to_upper())
	
	return result

# Mark a word as learned
func learn_word(english_word: String):
	if word_replacements.has(english_word):
		learned_words[english_word] = true
		var spanish_word = word_replacements[english_word]
		word_learned.emit(spanish_word, english_word)
		print("LEARNED: ", english_word, " = ", spanish_word)

# Advance to next dialogue line
func next_line():
	if not is_dialogue_active or waiting_for_choice:
		return
	
	current_line += 1
	show_current_line()

# Handle player choice selection
func make_choice(choice_index: int):
	if not waiting_for_choice:
		return
	
	waiting_for_choice = false
	
	# For now, just learn "yes" if they choose the first option
	if choice_index == 0:
		learn_word("yes")
		print("You chose: Yes, I'll help you!")
	else:
		print("You chose: What do you mean?")
	
	# Continue to next line
	current_line += 1
	show_current_line()

# End current dialogue
func end_dialogue():
	is_dialogue_active = false
	current_dialogue.clear()
	current_line = 0
	dialogue_finished.emit()

# Check if player knows a specific word
func knows_word(english_word: String) -> bool:
	return learned_words.get(english_word, false)

# Get learning progress as percentage
func get_learning_progress() -> float:
	var total_words = word_replacements.size()
	var learned_count = learned_words.size()
	return float(learned_count) / float(total_words) * 100.0
