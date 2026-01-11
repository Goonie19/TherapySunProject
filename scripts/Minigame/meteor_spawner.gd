extends Node2D

class_name MeteorSpawner

@export var meteor_default : PackedScene

@export var meteor_spawn_points : Array[Node2D]
	
func spawn_meteor(objective: Node2D):
	var meteor = meteor_default.instantiate()
	add_child(meteor)
	meteor.global_position = meteor_spawn_points.pick_random().global_position
	
	var dir = (objective.global_position - meteor.global_position).normalized()
	
	meteor.initialize(200, dir)
