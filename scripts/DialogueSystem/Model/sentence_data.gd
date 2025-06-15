extends Resource
class_name sentence_data

@export var character_speaking: character_data
@export var dialogue_string: String

@export var answers: Array[String]

func _init(character: character_data = null, dialogue_text: String = ""):
	character_speaking = character
	dialogue_string = dialogue_text
