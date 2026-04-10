extends Resource

class_name Action

@export var skip_wait: bool

signal on_action_finished

func do_action() -> void:
	print('DoAction')
