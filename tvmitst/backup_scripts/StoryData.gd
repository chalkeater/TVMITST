extends Resource
class_name StoryData
# StoryData - Contains all dialogue and story sequences
# This is where you "stick" your storyline in the codebase

# Opening sequence - Plaza Central
static func get_opening_sequence() -> Array:
	return [
		{
			"character": "Narrator",
			"text": "You arrive in a strange plaza where something magical is happening...",
			"teaches_word": null
		},
		{
			"character": "Mysterious Figure", 
			"text": "Hello, traveler! Welcome to our pueblo.",
			"teaches_word": "hello"  # First word learned
		},
		{
			"character": "Mysterious Figure",
			"text": "I am Carlos, and I need your help. Something strange has happened here.",
			"teaches_word": null
		},
		{
			"character": "Carlos",
			"text": "The words of our language are... how do you say... leaking into yours.",
			"teaches_word": null
		},
		{
			"character": "Carlos", 
			"text": "Please, will you help us? We need someone who can learn our words.",
			"teaches_word": "please"  # Second word learned
		},
		{
			"character": "Player",
			"text": "[Choice] Yes, I'll help you! / [Choice] What do you mean?",
			"teaches_word": "yes"  # Third word learned (if they choose yes)
		}
	]

# First house interaction - introduces basic nouns
static func get_house_interaction() -> Array:
	return [
		{
			"character": "Carlos",
			"text": "This is my house. It's been in my family for generations.",
			"teaches_word": "house"
		},
		{
			"character": "Carlos", 
			"text": "Would you like some water? The well behind the house has the sweetest water.",
			"teaches_word": "water"
		},
		{
			"character": "Carlos",
			"text": "My family lives here - my wife, children, and our dog.",
			"teaches_word": "family"
		},
		{
			"character": "Carlos",
			"text": "The dog is very friendly. He loves to play with visitors.",
			"teaches_word": "dog"
		}
	]

# Meeting the family - introduces relationships and common verbs
static func get_family_meeting() -> Array:
	return [
		{
			"character": "Maria",
			"text": "Hello! I am Carlos's wife. Thank you for helping us.",
			"teaches_word": "thank you"
		},
		{
			"character": "Maria",
			"text": "We want to show you something special. Please, come and see.",
			"teaches_word": "to see"
		},
		{
			"character": "Carlos",
			"text": "Yes, we want you to understand what has happened to our pueblo.",
			"teaches_word": "to want"
		}
	]

# The mystery deepens - more complex vocabulary
static func get_mystery_sequence() -> Array:
	return [
		{
			"character": "Carlos",
			"text": "Look at this book. It used to be written in Spanish, but now...",
			"teaches_word": "book"
		},
		{
			"character": "Maria", 
			"text": "The words change when people don't know them. It's like magic.",
			"teaches_word": null
		},
		{
			"character": "Carlos",
			"text": "We need you to learn our words so they can return to their proper place.",
			"teaches_word": null
		},
		{
			"character": "Maria",
			"text": "When you truly know a word, it will appear as it should be.",
			"teaches_word": null
		}
	]

# Vocabulary introduction sequences by category
static func get_color_sequence() -> Array:
	return [
		{
			"character": "Artist",
			"text": "Look at these beautiful colors! This red flower, this blue sky...",
			"teaches_word": "red"  # rojo
		},
		{
			"character": "Artist", 
			"text": "And see this blue water reflecting the white clouds?",
			"teaches_word": "blue"  # azul
		}
	]

static func get_food_sequence() -> Array:
	return [
		{
			"character": "Cook",
			"text": "Are you hungry? I have fresh food - bread, fruit, and soup.",
			"teaches_word": "food"
		},
		{
			"character": "Cook",
			"text": "This bread is warm from the oven. Would you like some?",
			"teaches_word": "bread"  # pan
		}
	]
