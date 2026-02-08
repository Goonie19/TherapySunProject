extends Node

@export var minigame_time : float

@export var minigame_timer: Timer
@export var spawn_timer: Timer
@export var meteor_spawner: MeteorSpawner
@export var sun_space_rotator_node: Node2D
@export var spawn_lapse: int
@export var meteor_sequence: SpawnSequence


#@export var character_rotator

var character: CharacterController
var current_meteor_pos: int


func _ready() -> void:
	start_minigame()

func set_dependencies(character_controller: CharacterController):
	character = character_controller

func start_minigame():
	current_meteor_pos = 0
	minigame_timer.start(meteor_sequence.sequence_time)
	spawn_timer.start(meteor_sequence.spawn_sequence[current_meteor_pos].time_stamp)
	sun_space_rotator_node.process_mode = Node.PROCESS_MODE_INHERIT
	

func spawn_random_meteor():
	meteor_spawner.spawn_meteor(sun_space_rotator_node, meteor_sequence.spawn_sequence[current_meteor_pos].spawn_pos)
	current_meteor_pos += 1
	
	if current_meteor_pos < meteor_sequence.spawn_sequence.size():
		spawn_timer.start(meteor_sequence.spawn_sequence[current_meteor_pos].time_stamp)


func finish_minigame():
	spawn_timer.stop()
	print("Sacabo")
