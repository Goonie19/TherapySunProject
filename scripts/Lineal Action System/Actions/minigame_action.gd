extends Action

class_name MinigameAction

@export var sequences: Array[MinigameSequence] 

var minigame_controller: MinigameController


func do_action() -> void:
	minigame_controller.start_minigame(self)
	await minigame_controller.on_minigame_finished
	on_action_finished.emit()

func set_dependencies(manager: MinigameController) -> void:
	minigame_controller = manager
