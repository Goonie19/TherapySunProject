extends Action

class_name MinigameAction

@export var minigame_time: float
@export var sequences: Array[MinigameSequence] 

var minigame_controller: MinigameController


func do_action() -> void:
	minigame_controller.start_minigame(self)
