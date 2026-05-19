extends Node

class_name AudioController

const AUDIO_BUS_NAME = "Master"

@onready var _bus := AudioServer.get_bus_index(AUDIO_BUS_NAME)
@export var music_player : AudioStreamPlayer2D
@export var music_player_2 : AudioStreamPlayer2D
@export var sfx_player : AudioStreamPlayer2D

@export var animator : AnimationPlayer

var value : float

func _ready() -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

func play_music(music_stream: AudioStream) -> void:
	if  not music_player.playing and not music_player_2.playing:
		music_player.stream = music_stream
		music_player.play()
		animator.play("FadeToTrack1")
		return
	
	if music_player.playing :
		music_player_2.stream = music_stream
		music_player_2.play()
		animator.play("FadeToTrack2")
		return
	
	if music_player_2.playing :
		music_player.stream = music_stream
		music_player.play()
		animator.play("FadeToTrack1")
		return

func play_sound(sfx_stream: AudioStream, random_pitch: bool = false) -> void:
	sfx_player.stream = sfx_stream
	
	if random_pitch:
		sfx_player.pitch_scale = randf_range(0.8, 1.2)
	else:
		sfx_player.pitch_scale = 1
	
	sfx_player.play()

func set_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(volume))
