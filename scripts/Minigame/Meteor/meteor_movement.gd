extends Node2D

class_name MeteorMovement

@export var rb: RigidBody2D
@export var anim_tree: AnimationTree

var speed : float = 201

var direction: Vector2 =Vector2(0,-1)

func _process(delta: float) -> void:
	position += speed * direction * delta

func initialize(new_speed: float, dir: Vector2):
	speed = new_speed
	direction = dir


func _on_area_2d_body_entered(body: Node2D) -> void:
	anim_tree.set("parameters/conditions/Break", true)
	

func destroy_meteor():
	queue_free()
