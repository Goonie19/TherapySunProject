extends Resource

class_name character_data

@export var character_name: String
@export var character_base_pose: Texture2D
@export var character_happy_pose: Texture2D
@export var character_angry_pose: Texture2D

func _init(name = "", base_pose = null, happy_pose = null, angry_pose = null):
	character_name = name
	character_base_pose = base_pose
	character_happy_pose = happy_pose
	character_angry_pose = angry_pose
