extends Node

class_name DialogueView

@export var dialogue_text: RichTextLabel
@export var dialogue_name_text: Label
@export var answer_buttons: Array[Button]
@export var timer: Timer

@export var dialogue : dialogue_data

@export var dialogue_panel_animation_player: AnimationPlayer

signal on_button_pass_pressed
signal on_dialogue_showed
signal on_dialogue_hidden

signal on_options_showed
signal on_options_hidden

var presenter: dialogue_presenter

var current_sentence: String = ""

func _ready():
	start_dialogue(dialogue)

func start_dialogue(dialogue: dialogue_data):
	presenter = dialogue_presenter.new(self, dialogue)
	presenter.start_dialogue()

func set_sentence(sentence: sentence_data):
	current_sentence = sentence.dialogue_string
	
func update_text(index: int):
	dialogue_text.text = current_sentence
	dialogue_text.visible_characters = index + 1

func show_dialogue_panel():
	dialogue_panel_animation_player.play("Appear")
	

func hide_dialogue_panel():
	dialogue_panel_animation_player.play("Disappear")
	

func show_dialogue_options(dialogue_answers: Array[dialogue_option]):
	for i in range(0, answer_buttons.size()):
		answer_buttons[i].text = dialogue_answers[i].option_string
	
	dialogue_panel_animation_player.play("AppearOptions")

func hide_dialogue_options():
	dialogue_panel_animation_player.play("HideOptions")

func press_next_button():
	on_button_pass_pressed.emit()
	

func options_showed():
	on_options_showed.emit()

func options_hidden():
	on_options_hidden.emit()

func dialogue_showed():
	on_dialogue_showed.emit()

func dialogue_hidden():
	on_dialogue_hidden.emit()
