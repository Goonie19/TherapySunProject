extends Node

class_name AudioController

const AUDIO_BUS_NAME = "Master"

@onready var _bus := AudioServer.get_bus_index(AUDIO_BUS_NAME)
@export var music_player : AudioStreamPlayer2D
@export var sfx_player : AudioStreamPlayer2D

var value : float

func _ready() -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

func play_music(music_stream: AudioStream) -> void:
	music_player.stream = music_stream
	music_player.play()

func play_sound(sfx_stream: AudioStream, random_pitch: bool = false) -> void:
	sfx_player.stream = sfx_stream
	
	if random_pitch:
		sfx_player.pitch_scale = randf_range(0.8, 1.2)
	else:
		sfx_player.pitch_scale = 1
	
	sfx_player.play()

func set_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(volume))
