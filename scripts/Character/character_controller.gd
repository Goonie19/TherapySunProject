extends Node2D

class_name CharacterController

@export var data: character_data

@export var anim : AnimationPlayer
@export var anim_tree : AnimationTree

var current_state : CharacterState.character_state = CharacterState.character_state.Sad
signal reached_destination

func _ready() -> void:
	data.set_dependencies(self)

func set_character_state(state: CharacterState.character_state) -> void:
	print('placeholder')

func move_to(destination: Vector2, time_to_reach_destination: float) -> void:
	var tween = create_tween()
	tween.tween_property(self, "position", destination, time_to_reach_destination)
	await tween.finished
	reached_destination.emit()
