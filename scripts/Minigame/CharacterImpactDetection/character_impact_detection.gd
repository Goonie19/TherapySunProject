extends Node2D

class_name CharacterImpactDetection

@export var rotator: BlockerRotator

@export var trauma_for_camera: float = 0.2

var character: SunController
var camera : CameraBehaviour

func set_dependencies(char: SunController, camera_behaviour : CameraBehaviour):
	character = char
	camera = camera_behaviour

func receive_impact(area: Area2D): 
	if(character != null):
		character.Hit()
		camera.add_trauma(trauma_for_camera)
		camera.frameFreeze(0.05, 0.1)

func set_rotator(spawn: bool) -> void:
	if spawn :
		rotator.appear()
		await rotator.on_appear
	else: 
		rotator.disappear()
		await rotator.on_disappear
