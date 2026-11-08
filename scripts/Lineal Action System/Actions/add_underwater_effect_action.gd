extends Action

class_name AddUnderwaterEffectAction

@export var remove : bool = false

var audio_controller : AudioController

func do_action() -> void:
	audio_controller.set_underwater_effect(!remove)
	on_action_finished.emit()

func set_dependencies(audio_controller: AudioController) -> void:
	self.audio_controller = audio_controller
