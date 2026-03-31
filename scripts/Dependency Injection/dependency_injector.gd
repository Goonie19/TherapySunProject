extends Node

@export var minigame_controller: MinigameController
@export var character_controller: CharacterController
@export var dialogue_controller: DialogueView
@export var black_screen: BlackScreen
@export var lineal_action_controller: LinealActionController
@export var audio_controller: AudioController

func _ready() -> void:
	minigame_controller.set_dependencies(character_controller, dialogue_controller)
	
	lineal_action_controller.set_dependencies(dialogue_controller, 
		minigame_controller, 
		black_screen, 
		audio_controller
	)
	
	dialogue_controller.set_dependencies(audio_controller)
