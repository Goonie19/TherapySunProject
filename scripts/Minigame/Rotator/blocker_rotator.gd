extends Node2D

class_name BlockerRotator

@export var animation_player: AnimationPlayer
@export var rotation_speed : float = 12000

var target_dir : Vector2

signal on_appear
signal on_disappear

func _process(delta: float) -> void:
	read_input()
	
	setRotation(target_dir, delta)

func setRotation(dir: Vector2, delta: float):
	var target: Vector2 = global_position + target_dir
	
	var current_rotation = rotation
	var target_rotation = dir.angle()
	
	#almost there mi man
	rotation = lerp_angle(current_rotation, target_rotation, rotation_speed * delta)

func read_input():
	var dir = Input.get_vector("RotateBlockerLeft", "RotateBlockerRight", "RotateBlockerUp", "RotateBlockerDown")	
	
	if dir != Vector2.ZERO:
		target_dir = dir
	

func appear() -> void:
	animation_player.play("Appear")
	
func disappear() -> void: 
	animation_player.play("Disappear")

func call_appeared()->void:
	on_appear.emit()

func call_disappeared() -> void: 
	on_disappear.emit()

func _on_blocker_area_2d_area_entered(area: Area2D) -> void:
	print("Yo si que lo detecto")
