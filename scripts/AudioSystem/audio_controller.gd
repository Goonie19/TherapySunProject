extends Node

class_name AudioController

const AUDIO_BUS_NAME = "Master"

@onready var _bus := AudioServer.get_bus_index(AUDIO_BUS_NAME)
@export var music_players : Array[AudioStreamPlayer2D]

@export var sfx_player : AudioStreamPlayer2D

@export var animator : AnimationPlayer

var value : float

func _ready() -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))

func play_music(music_streams: Array[AudioStream]) -> void:
	var i : int = 0;
	
	while(i < music_streams.size() and i < music_players.size()):
		music_players[i].stream = music_streams[i]
		music_players[i].play()
		i = i + 1
	animator.play("Iddle")
	

func play_sound(sfx_stream: AudioStream, random_pitch: bool = false) -> void:
	sfx_player.stream = sfx_stream
	
	if random_pitch:
		sfx_player.pitch_scale = randf_range(0.8, 1.2)
	else:
		sfx_player.pitch_scale = 1
	
	sfx_player.play()

func play_track(track_name : String) -> void:
	animator.play(track_name)

func set_volume(volume: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear_to_db(volume))
