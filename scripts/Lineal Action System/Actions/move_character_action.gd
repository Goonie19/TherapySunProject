extends Action

class_name MoveCharacterAction

@export var character: character_data
@export var destination: Vector2
@export var time_to_reach_destination: float

func do_action() -> void:
	character.get_controller().move_to(destination, time_to_reach_destination)
	await character.get_controller().reached_destination
	on_action_finished.emit()

func set_dependencies() -> void:
	print('ola')
