extends Resource

class_name character_data

@export var character_name: String
@export var character_dialogue_panel: StyleBoxTexture

var controller: CharacterController

func _init(name = "", base_pose = null, happy_pose = null, angry_pose = null):
	character_name = name


func set_dependencies(character_controller: CharacterController) -> void:
	controller = character_controller

func get_controller() -> CharacterController:
	return controller
