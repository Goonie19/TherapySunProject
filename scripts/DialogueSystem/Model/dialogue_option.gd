class_name dialogue_option
extends Resource

@export var option_string: String
@export var next_dialogue: dialogue_data

func _init(option_text: String = "", dialogue: dialogue_data = null):
	option_string = option_text
	next_dialogue = dialogue
