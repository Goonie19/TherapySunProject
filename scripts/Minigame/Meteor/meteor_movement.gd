extends CharacterBody2D

class_name MeteorMovement

var speed : float = 201

var direction: Vector2 =Vector2(0,-1)

func _process(delta: float) -> void:
	velocity = speed * direction
	move_and_slide() 

func initialize(new_speed: float, dir: Vector2):
	speed = new_speed
	direction = dir
