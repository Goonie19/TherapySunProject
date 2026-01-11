extends Node2D

@export var rotation_speed : float = 3

var direction : float

func _process(delta: float) -> void:
	read_input()
	
	rotation += rotation_speed * delta * direction

func setRotation(rotationDir:float):
	direction = rotationDir

func read_input():
	var dir = 0
	if Input.is_key_pressed(KEY_RIGHT):
		dir += 1
	if Input.is_key_pressed(KEY_LEFT):
		dir -= 1
	
	setRotation(dir)


func _on_blocker_area_2d_area_entered(area: Area2D) -> void:
	print("Yo si que lo detecto")
