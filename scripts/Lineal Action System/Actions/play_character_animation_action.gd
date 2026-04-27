extends Action

class_name PlayCharacterAnimationAction

@export var character: character_data
@export var state: CharacterState.character_state

func do_action() -> void:
	character.get_controller().set_character_state(state)
	on_action_finished.emit()

func set_dependencies() -> void:
	print('ola')
