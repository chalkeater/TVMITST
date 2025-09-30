extends GutTest
# Golden path tests for vocabulary learning mechanics
# These tests validate core learning functionality

var language_manager: Node

func before_each():
	language_manager = load("res://scripts/SpanishLearningManager.gd").new()
	add_child_autofree(language_manager)
	language_manager._ready()  # Initialize scene vocabulary

func test_learning_word_marks_it_as_learned():
	language_manager.learn_word("hello")
	
	assert_true(language_manager.knows_word("hello"), "Word should be marked as learned")

func test_stress_affects_initial_mastery():
	# High stress = poor learning
	language_manager.dave_stress_level = 0.8
	language_manager.learn_word("hello")
	
	var mastery = language_manager.word_mastery_levels.get("hello", "")
	assert_eq(mastery, "unknown", "High stress should result in 'unknown' mastery")
	
	# Low stress = better learning
	language_manager.dave_stress_level = 0.2
	language_manager.learn_word("please")
	
	mastery = language_manager.word_mastery_levels.get("please", "")
	assert_eq(mastery, "confident", "Low stress should result in 'confident' mastery")

func test_acceptance_moment_upgrades_mastery():
	# Learn some words at basic level
	language_manager.dave_stress_level = 0.5
	language_manager.learn_word("hello")
	language_manager.learn_word("please")
	
	# Trigger acceptance moment
	language_manager.trigger_acceptance_moment()
	
	# Check mastery upgrades
	var hello_mastery = language_manager.word_mastery_levels.get("hello", "")
	assert_eq(hello_mastery, "confident", "Acceptance should upgrade 'learning' to 'confident'")

func test_vocabulary_progress_calculation():
	# Scene 1 has multiple words, learn a few
	language_manager.learn_word("hello")
	language_manager.learn_word("please")
	language_manager.learn_word("thank you")
	
	var stats = language_manager.get_learning_stats()
	
	assert_gt(stats.progress_percentage, 0.0, "Should have some progress")
	assert_lt(stats.progress_percentage, 100.0, "Should not be complete")
	assert_eq(stats.learned_words, 3, "Should have 3 words learned")

func test_get_spanish_word_returns_correct_translation():
	var spanish = language_manager.get_spanish_word("hello")
	assert_eq(spanish, "hola", "Should return correct Spanish translation")
	
	var unknown = language_manager.get_spanish_word("nonexistent")
	assert_eq(unknown, "nonexistent", "Should return original word if not found")

func test_knows_word_with_mastery_levels():
	language_manager.learn_word("hello")
	language_manager.word_mastery_levels["hello"] = "confident"
	
	assert_true(language_manager.knows_word("hello", "learning"), "'confident' meets 'learning' requirement")
	assert_true(language_manager.knows_word("hello", "confident"), "'confident' meets 'confident' requirement")
	assert_false(language_manager.knows_word("hello", "mastered"), "'confident' doesn't meet 'mastered' requirement")
