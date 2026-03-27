extends Action

class_name DialogueAction

@export var dialogue : DialogueData

var dialogue_manager : DialogueView

func do_action() -> void:
	dialogue_manager.start_dialogue(dialogue)
	await dialogue_manager.on_dialogue_finished
	on_action_finished.emit()

func set_dependencies(manager: DialogueView) -> void:
	dialogue_manager = manager
