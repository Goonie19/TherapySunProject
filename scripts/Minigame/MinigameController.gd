extends Node

@export var minigame_time : float

@export var minigame_timer: Timer
@export var spawn_timer: Timer
@export var meteor_spawner: MeteorSpawner
@export var sun_space_rotator_node: Node2D
@export var spawn_lapse: int

#@export var character_rotator

func _ready() -> void:
	start_minigame()

func start_minigame():
	minigame_timer.start(minigame_time)
	spawn_timer.start(spawn_lapse)
	sun_space_rotator_node.process_mode = Node.PROCESS_MODE_INHERIT
	

func spawn_random_meteor():
	meteor_spawner.spawn_meteor(sun_space_rotator_node)
	spawn_timer.start(spawn_lapse)


func finish_minigame():
	spawn_timer.stop()
	print("Sacabo")
