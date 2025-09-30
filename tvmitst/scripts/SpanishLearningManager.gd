extends Node
# SpanishLearningManager - Integrates Spanish vocabulary learning with Escoria
# Adapted from your original DialogueManager but designed for point-and-click adventures

signal word_learned(spanish_word: String, english_word: String)
signal vocabulary_progress_updated(progress: float)
signal emotional_state_changed(stress_level: float)

# Learning progress tracking
var learned_words: Dictionary = {}
var word_mastery_levels: Dictionary = {}  # unknown, learning, confident, mastered
var current_scene_vocabulary: Array = []

# Dave's emotional state affects learning difficulty
var dave_stress_level: float = 0.5  # 0.0 = calm, 1.0 = panic
var acceptance_moments: int = 0

# Scene 1 vocabulary (25 words from your design docs)
var scene_1_vocabulary: Dictionary = {
	# Basic survival Spanish
	"hello": "hola",
	"please": "por favor", 
	"thank you": "gracias",
	"help": "ayuda",
	"I need": "necesito",
	"I have": "tengo",
	"where is": "dónde está",
	"I don't understand": "no entiendo",
	
	# Dave's chaos vocabulary
	"basement": "sótano",
	"room": "habitación", 
	"problem": "problema",
	"lost": "perdido",
	"confused": "confundido",
	"desperate": "desesperado",
	"chaos": "caos",
	
	# Essential questions
	"what": "qué",
	"where": "dónde",
	"how": "cómo",
	"who": "quién",
	
	# Basement items
	"box": "caja",
	"note": "nota",
	"wifi": "wifi",
	"password": "contraseña"
}

func _ready():
	print("SpanishLearningManager ready - integrating with Escoria")
	initialize_scene_vocabulary(1)  # Start with Scene 1

# Initialize vocabulary for a specific scene
func initialize_scene_vocabulary(scene_number: int):
	match scene_number:
		1:
			current_scene_vocabulary = scene_1_vocabulary.keys()
			print("Loaded Scene 1 vocabulary: ", current_scene_vocabulary.size(), " words")

# Learn a word through interaction (called by Escoria items/dialogue)
func learn_word(english_word: String, _context: String = ""):
	if not scene_1_vocabulary.has(english_word):
		print("Warning: Word not in current vocabulary: ", english_word)
		return
	
	var spanish_word = scene_1_vocabulary[english_word]
	
	# Set initial mastery level based on Dave's emotional state
	var initial_level = "learning"
	if dave_stress_level > 0.7:
		initial_level = "unknown"  # Too stressed to learn well
	elif dave_stress_level < 0.3:
		initial_level = "confident"  # Calm enough to absorb quickly
	
	learned_words[english_word] = true
	word_mastery_levels[english_word] = initial_level
	
	word_learned.emit(spanish_word, english_word)
	update_vocabulary_progress()
	
	print("LEARNED: ", english_word, " = ", spanish_word, " (", initial_level, ")")

# Update Dave's emotional state (affects learning difficulty)
func update_emotional_state(stress_change: float, reason: String = ""):
	dave_stress_level = clamp(dave_stress_level + stress_change, 0.0, 1.0)
	emotional_state_changed.emit(dave_stress_level)
	
	print("Dave's stress level: ", dave_stress_level, " (", reason, ")")

# Check if player knows a word at a certain mastery level
func knows_word(english_word: String, required_level: String = "learning") -> bool:
	if not learned_words.get(english_word, false):
		return false
	
	var current_level = word_mastery_levels.get(english_word, "unknown")
	var level_hierarchy = ["unknown", "learning", "confident", "mastered"]
	var current_index = level_hierarchy.find(current_level)
	var required_index = level_hierarchy.find(required_level)
	
	return current_index >= required_index

# Get Spanish translation for display in UI
func get_spanish_word(english_word: String) -> String:
	return scene_1_vocabulary.get(english_word, english_word)

# Create mixed EN/SP text based on learning phase (0.0 = all EN, 1.0 = all SP)
func mixed_text(line: Dictionary, phase: float) -> String:
	var english = line.get("EN", "")
	var spanish = line.get("SP", "")
	
	if phase <= 0.0:
		return english
	elif phase >= 1.0:
		return spanish
	else:
		# Mix both languages - show both with Spanish emphasized
		return "%s (%s)" % [spanish, english]

# Replace English text with Spanish based on learning progress
func process_text_for_learning(text: String) -> String:
	var result = text
	
	for english_word in learned_words.keys():
		if learned_words[english_word] and knows_word(english_word, "confident"):
			var spanish_word = get_spanish_word(english_word)
			# Simple replacement - could be made more sophisticated
			result = result.replace(english_word, spanish_word)
	
	return result

# Update overall vocabulary progress
func update_vocabulary_progress():
	var total_words = current_scene_vocabulary.size()
	var learned_count = 0
	
	for word in current_scene_vocabulary:
		if learned_words.get(word, false):
			learned_count += 1
	
	var progress = float(learned_count) / float(total_words)
	vocabulary_progress_updated.emit(progress)

# Get learning statistics for UI display
func get_learning_stats() -> Dictionary:
	var stats = {
		"total_words": current_scene_vocabulary.size(),
		"learned_words": learned_words.size(),
		"mastery_breakdown": {},
		"stress_level": dave_stress_level,
		"progress_percentage": 0.0
	}
	
	# Count words by mastery level
	for level in ["unknown", "learning", "confident", "mastered"]:
		stats.mastery_breakdown[level] = 0
	
	for word in learned_words.keys():
		var level = word_mastery_levels.get(word, "unknown")
		stats.mastery_breakdown[level] += 1
	
	stats.progress_percentage = float(learned_words.size()) / float(current_scene_vocabulary.size()) * 100.0
	
	return stats

# Called by Escoria when Dave has a breakthrough moment
func trigger_acceptance_moment():
	acceptance_moments += 1
	update_emotional_state(-0.2, "acceptance moment")
	
	# Upgrade some words to higher mastery levels
	for word in learned_words.keys():
		var current_level = word_mastery_levels.get(word, "unknown")
		if current_level == "learning":
			word_mastery_levels[word] = "confident"
		elif current_level == "confident":
			word_mastery_levels[word] = "mastered"
	
	print("Acceptance moment! Dave's understanding deepens.")

# Save learning progress (integrates with Escoria's save system)
func get_save_data() -> Dictionary:
	return {
		"learned_words": learned_words,
		"word_mastery_levels": word_mastery_levels,
		"dave_stress_level": dave_stress_level,
		"acceptance_moments": acceptance_moments
	}

# Load learning progress
func load_save_data(data: Dictionary):
	learned_words = data.get("learned_words", {})
	word_mastery_levels = data.get("word_mastery_levels", {})
	dave_stress_level = data.get("dave_stress_level", 0.5)
	acceptance_moments = data.get("acceptance_moments", 0)
	
	update_vocabulary_progress()
