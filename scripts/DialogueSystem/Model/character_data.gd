class_name character_data

var character_name: String
var character_base_pose: Sprite2D
var character_happy_pose: Sprite2D
var character_angry_pose: Sprite2D

func _init(name, base_pose, happy_pose, angry_pose):
	character_name = name
	character_base_pose = base_pose
	character_happy_pose = happy_pose
	character_angry_pose = angry_pose
