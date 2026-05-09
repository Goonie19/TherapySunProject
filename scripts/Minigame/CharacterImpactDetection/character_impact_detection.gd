extends Node2D

class_name CharacterImpactDetection

@export var rotator: BlockerRotator
var character: SunController

func set_dependencies(char: SunController):
	character = char

func receive_impact(area: Area2D): 
	if(character != null):
		character.Hit()

func set_rotator(spawn: bool) -> void:
	if spawn :
		rotator.appear()
		await rotator.on_appear
	else: 
		rotator.disappear()
		await rotator.on_disappear
