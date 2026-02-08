extends Resource
class_name MeteorSpawnSequenceData

enum METEOR_SPAWN_POSITIONS {
	UP,
	UPRIGHT,
	RIGHT,
	DOWNRIGHT,
	DOWN,
	DOWNLEFT,
	LEFT,
	UPLEFT
}

@export var spawn_pos: METEOR_SPAWN_POSITIONS
@export var time_stamp: float
