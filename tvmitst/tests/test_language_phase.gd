extends GutTest
# Golden path tests for language learning system
# Keep these tests green - they validate core functionality for AI development

var language_manager: Node

func before_each():
	# Create a fresh instance for each test
	language_manager = load("res://scripts/SpanishLearningManager.gd").new()
	add_child_autofree(language_manager)

func test_phase_mix_shows_both_languages():
	var line = {"EN": "Hello", "SP": "Hola"}
	var mixed = language_manager.mixed_text(line, 0.5)
	
	assert_string_contains(mixed, "Hola", "Should contain Spanish word")
	assert_string_contains(mixed, "Hello", "Should contain English word")

func test_phase_zero_shows_only_english():
	var line = {"EN": "Hello", "SP": "Hola"}
	var result = language_manager.mixed_text(line, 0.0)
	
	assert_eq(result, "Hello", "Phase 0.0 should return English only")

func test_phase_one_shows_only_spanish():
	var line = {"EN": "Hello", "SP": "Hola"}
	var result = language_manager.mixed_text(line, 1.0)
	
	assert_eq(result, "Hola", "Phase 1.0 should return Spanish only")

func test_phase_negative_defaults_to_english():
	var line = {"EN": "Hello", "SP": "Hola"}
	var result = language_manager.mixed_text(line, -0.5)
	
	assert_eq(result, "Hello", "Negative phase should return English")

func test_phase_above_one_shows_spanish():
	var line = {"EN": "Hello", "SP": "Hola"}
	var result = language_manager.mixed_text(line, 1.5)
	
	assert_eq(result, "Hola", "Phase > 1.0 should return Spanish only")
