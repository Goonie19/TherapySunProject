extends Action

class_name FadeBlackAction

@export var fade_value: float
@export var time_to_fade: float

var black_screen: BlackScreen

func do_action() -> void:
	black_screen.fade(fade_value, time_to_fade)
	await black_screen.on_fade_completed
	on_action_finished.emit()

func set_dependencies(screen: BlackScreen) -> void:
	black_screen = screen
