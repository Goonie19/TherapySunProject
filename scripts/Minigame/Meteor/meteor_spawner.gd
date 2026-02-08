extends Node2D

class_name MeteorSpawner

@export var meteor_default : PackedScene

@export var spawn_points_center: Node2D

@export var meteor_spawn_points : Array[MeteorSpawnPosition]

func spawn_meteor(objective: Node2D, pos: MeteorSpawnSequenceData.METEOR_SPAWN_POSITIONS = MeteorSpawnSequenceData.METEOR_SPAWN_POSITIONS.UP):
	#Hay que hacer que coja la posicion dependiendo del valor pasado
	var meteor = meteor_default.instantiate()
	add_child(meteor)
	meteor.global_position = spawn_points_center.global_position + meteor_spawn_points[find_meteor_pos(pos)].spawn_pos
	
	var dir = (objective.global_position - meteor.global_position).normalized()
	
	meteor.initialize(200, dir)

#Finds index of specific element
func find_meteor_pos(pos: MeteorSpawnSequenceData.METEOR_SPAWN_POSITIONS):
	var found = false
	var i = 0
	while i < meteor_spawn_points.size() and not found:
		if meteor_spawn_points[i].spawn_pos_label == pos:
			found = true
		else:
			i = i+1
			
	if not found:
		i = -1
		
	return i
