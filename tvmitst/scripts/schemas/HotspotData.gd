extends Resource
class_name HotspotData
## Schema for hotspot/interactive item content that can be edited via JSON

## Unique identifier matching the ESCItem's global_id in the scene
@export var id: String = ""

## Spanish word this hotspot teaches (links to vocabulary system)
@export var spanish_word: String = ""

## English translation of the spanish_word
@export var english_word: String = ""

## Which ESC event to trigger on interaction (e.g., "look_sticky_note")
@export var interaction_event: String = ""

## Tooltip text shown in English
@export var tooltip_en: String = ""

## Tooltip text shown in Spanish
@export var tooltip_sp: String = ""

## Current language phase for this item: "EN", "SP_EN", or "SP"
@export_enum("EN", "SP_EN", "SP") var phase: String = "EN"

## Optional: Audio file path for Spanish pronunciation
@export var audio_pronunciation: String = ""

## Creates HotspotData from a dictionary (for JSON loading)
static func from_dict(data: Dictionary) -> HotspotData:
	var hotspot = HotspotData.new()
	hotspot.id = data.get("id", "")
	hotspot.spanish_word = data.get("spanish_word", "")
	hotspot.english_word = data.get("english_word", "")
	hotspot.interaction_event = data.get("interaction_event", "")
	hotspot.tooltip_en = data.get("tooltip_en", "")
	hotspot.tooltip_sp = data.get("tooltip_sp", "")
	hotspot.phase = data.get("phase", "EN")
	hotspot.audio_pronunciation = data.get("audio_pronunciation", "")
	return hotspot
