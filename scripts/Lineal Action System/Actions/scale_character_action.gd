extends Action

class_name ScaleCharacterAction

@export var character: character_data
@export var target_scale: float
@export var time_to_reach_scale: float

func do_action() -> void:
	character.get_controller().scale_to(target_scale, time_to_reach_scale)
	if not skip_wait :
		await character.get_controller().reached_destination
	on_action_finished.emit()

func set_dependencies() -> void:
	print('ola')
