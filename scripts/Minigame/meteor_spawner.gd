extends Node2D

class_name meteor_spawner

@export var meteor_default : PackedScene

@export var meteor_spawn_points : Array[Node2D]

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		spawn_meteor()
	
func spawn_meteor():
	var meteor = meteor_default.instantiate()
	add_child(meteor)
	meteor.global_position = meteor_spawn_points[0].global_position
	meteor.initialize(100, Vector2(0,1))
