extends Action

class_name PlayMusicAction

@export var music_to_play: AudioStream

var audio_controller : AudioController

func do_action() -> void:
	audio_controller.play_music(music_to_play)
	on_action_finished.emit()


func set_dependencies(audio_controller: AudioController) -> void:
	self.audio_controller = audio_controller
