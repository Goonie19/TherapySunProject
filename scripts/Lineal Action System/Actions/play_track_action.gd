extends Action

class_name PlayTrackAction

@export var track_to_play : String

var audio_controller : AudioController

func do_action() -> void:
	audio_controller.play_track(track_to_play)


func set_dependencies(audio_controller: AudioController) -> void:
	self.audio_controller = audio_controller
