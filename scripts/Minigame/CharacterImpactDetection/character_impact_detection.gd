extends Node2D

class_name CharacterImpactDetection

@export var rotator: BlockerRotator
var character: CharacterController

func set_dependencies(char: CharacterController):
	character = char

func receive_impact(area: Area2D): 
	if(character):
		character.set_character_state(CharacterState.character_state.Hit)

func set_rotator(spawn: bool) -> void:
	if spawn :
		rotator.appear()
		await rotator.on_appear
	else: 
		rotator.disappear()
		await rotator.on_disappear
