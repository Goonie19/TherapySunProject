class_name sentence_data

var character_speaking: character_data
var dialogue_string: String

func _init(character: character_data, dialogue_text: String):
	character_speaking = character
	dialogue_string = dialogue_text
