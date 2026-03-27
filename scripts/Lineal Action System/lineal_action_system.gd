extends Node2D

@export var dialogue_to_inject: DialogueView
@export var minigame_to_inject: MinigameController

@export var actions: Array[Action]

func _ready() -> void:
	for i in range(0, actions.size()):
		inject_to_action(actions[i])
	
	play_actions_async()

func play_actions_async() -> void:
	for i in range(0, actions.size()):
		actions[i].do_action()
		await actions[i].on_action_finished

func inject_to_action(action: Action) -> void:
	#I don't actually know how to do this using match
	if action is DialogueAction:
		action.set_dependencies(dialogue_to_inject)
	if action is MinigameAction:
		action.set_dependencies(minigame_to_inject)
