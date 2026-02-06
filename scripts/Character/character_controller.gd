extends Node

class_name CharacterController

@export var anim : AnimationPlayer
@export var anim_tree : AnimationTree

var current_state : CharacterState.character_state = CharacterState.character_state.Sad

func set_character_state(state: CharacterState.character_state) -> void:
	print(state)
