class_name dialogue_option
extends Resource

var option_string: String
var next_dialogue: dialogue_data

func _init(option_text: String, dialogue: dialogue_data):
	option_string = option_text
	next_dialogue = dialogue
