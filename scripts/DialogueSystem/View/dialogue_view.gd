extends Node

class_name DialogueView

@export var dialogue_text: Label
@export var dialogue_name_text: Label
@export var answer_buttons: Array[Button]

@export var dialogue : dialogue_data

@export var dialogue_panel_animation_player: AnimationPlayer

signal on_button_pass_pressed
signal on_dialogue_showed
signal on_dialogue_hidden

signal on_options_showed
signal on_options_hidden

var current_sentence: String = ""

func set_sentence(sentence: sentence_data):
	current_sentence = sentence.dialogue_string
	
func update_text(index: int):
	var text = ""
	text = current_sentence.substr(0, index)
	text = text + "[color=#00000000]" + current_sentence.substr(index) + "[/color]"
	dialogue_text.text = text

func show_dialogue_panel():
	dialogue_panel_animation_player.play("Appear")
	

func hide_dialogue_panel():
	dialogue_panel_animation_player.play("Disappear")
	

func show_dialogue_options(dialogue_answers: Array[String]):
	for i in range(0, answer_buttons.size()):
		answer_buttons[i].text = dialogue_answers[i]
	
	dialogue_panel_animation_player.play("AppearOptions")

func hide_dialogue_options():
	dialogue_panel_animation_player.play("HideOptions")
