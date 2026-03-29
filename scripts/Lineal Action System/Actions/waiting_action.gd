extends Action

class_name WaitingAction

@export var time_to_wait: float

var timer: Timer

func do_action() -> void:
	timer.start(time_to_wait)
	await timer.timeout
	on_action_finished.emit()

func set_dependencies(timer_to_inject: Timer) -> void:
	timer = timer_to_inject
