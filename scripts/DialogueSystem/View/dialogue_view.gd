extends Node

class_name DialogueView

@export var dialogue_screen_center_text: RichTextLabel
@export var dialogue_text: RichTextLabel
@export var dialogue_panel: Panel
@export var dialogue_name_text: Label
@export var answer_buttons: Array[Button]
@export var timer: Timer

@export var dialogue_panel_animation_player: AnimationPlayer
@export var dialogue_character_sound: AudioStream

var presenter: dialogue_presenter

var current_sentence: String = ""

var audio_controller: AudioController

signal on_button_pass_pressed
signal on_dialogue_showed
signal on_dialogue_hidden

signal on_options_showed
signal on_options_hidden

signal on_dialogue_finished

func start_dialogue(dialogue: DialogueData):
	presenter = dialogue_presenter.new(self, dialogue)
	presenter.start_dialogue()

func set_sentence(sentence: sentence_data):
	#changes the panel texture depending on the character
	dialogue_panel.remove_theme_stylebox_override("panel")
	dialogue_panel.add_theme_stylebox_override("panel", sentence.character_speaking.character_dialogue_panel)
	
	current_sentence = sentence.dialogue_string
	dialogue_name_text.text = sentence.character_speaking.character_name
	sentence.character_speaking.controller.set_character_state(sentence.state)

func set_character_state_iddle(sentence: sentence_data) -> void:
	sentence.character_speaking.controller.set_character_state(CharacterState.character_state.Iddle)


func update_text(index: int):
	dialogue_screen_center_text.text = ""
	dialogue_text.text = current_sentence
	dialogue_text.visible_characters = index + 1
	
	if index % 3 == 0:
		audio_controller.play_sound(dialogue_character_sound, true)
	

func update_central_text(index : int) -> void:
	dialogue_text.text = ""
	dialogue_screen_center_text.text = current_sentence
	dialogue_screen_center_text.visible_characters = index + 1
	
	if index % 3 == 0:
		audio_controller.play_sound(dialogue_character_sound, true)

func reset_central_text() -> void:
	dialogue_screen_center_text.text = ""
	dialogue_screen_center_text.visible_characters = 0

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

func finish_dialogue():
	on_dialogue_finished.emit()

func set_dependencies(audio_controller: AudioController) -> void:
	self.audio_controller = audio_controller
