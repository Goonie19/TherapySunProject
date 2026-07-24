extends Action

class_name FadeOutCloudAction

@export var character: character_data

func do_action() -> void:
	await character.get_controller().fade_out_clouds()
	on_action_finished.emit()

func set_dependencies() -> void:
	pass
