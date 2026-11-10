extends Node

class_name AudioController

const AUDIO_BUS_NAME = "Master"
const AUDIO_MUSIC_BUS_NAME = "Music"

@onready var _bus := AudioServer.get_bus_index(AUDIO_BUS_NAME)
@onready var _musicBus := AudioServer.get_bus_index(AUDIO_MUSIC_BUS_NAME)
@export var music_players : Array[AudioStreamPlayer2D]
@export var main_music_player : AudioStreamPlayer2D
@export var alt_music_player : AudioStreamPlayer2D

@export var sfx_player : AudioStreamPlayer2D

@export var animator : AnimationPlayer

@export var defaultReverb : AudioEffectReverb
@export var defaultLowPass : AudioEffectLowPassFilter


var value : float

var reverbEffect : AudioEffectReverb
var lowPassEffect : AudioEffectLowPassFilter
var pitchEffect : AudioEffectPitchShift

func _ready() -> void:
	value = db_to_linear(AudioServer.get_bus_volume_db(_bus))
	#Hardcodeado feisimo pero es lo que hay
	reverbEffect = AudioServer.get_bus_effect(1, 1) as AudioEffectReverb
	lowPassEffect = AudioServer.get_bus_effect(1, 2) as AudioEffectLowPassFilter
	pitchEffect = AudioServer.get_bus_effect(1, 3) as AudioEffectPitchShift

func play_music(music_streams: Array[AudioStream]) -> void:
	var i : int = 0;
	
	check_crossfade()
	
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

func set_underwater_effect(underwater : bool) -> void:
	AudioServer.set_bus_effect_enabled(1, 0, underwater)
	
	var pitchTween = get_tree().create_tween()
	
	if underwater :
		pitchTween.tween_property(pitchEffect, "pitch_scale", 0.8, 0.5)
	else:
		pitchTween.tween_property(pitchEffect, "pitch_scale", 1, 0.5)
	
	set_reverb_effect(underwater)
	set_lowpass_effect(underwater)

func set_reverb_effect (underwater: bool) -> void:
	var reverbTween = get_tree().create_tween()
	if underwater :
		reverbTween.tween_property(reverbEffect, "wet", 0.4, 1.0)
		reverbTween.tween_property(reverbEffect, "room_size", 0.8, 1.0)
	else:
		reverbTween.tween_property(reverbEffect, "wet", defaultReverb.wet, 1.0)
		reverbTween.tween_property(reverbEffect, "room_size", defaultReverb.room_size, 1.0)

func set_lowpass_effect(underwater: bool) -> void:
	var lowPassTween = get_tree().create_tween()
	if underwater :
		lowPassTween.tween_property(lowPassEffect, "cutoff_hz", 1900, 1.0)
		lowPassTween.tween_property(lowPassEffect, "resonance", 0.3, 1.0)
		lowPassEffect.db = AudioEffectFilter.FILTER_12DB
	else: 
		lowPassTween.tween_property(lowPassEffect, "cutoff_hz", defaultLowPass.cutoff_hz, 1.0)
		lowPassTween.tween_property(lowPassEffect, "resonance", defaultLowPass.resonance, 1.0)
		lowPassEffect.db = AudioEffectFilter.FILTER_6DB

func check_crossfade() ->void:
	var dbTween = get_tree().create_tween()
	var altDbTween = get_tree().create_tween()
	
	if main_music_player.playing:
		music_players[0] = alt_music_player
		dbTween.tween_property(main_music_player, "volume_db", -80, 1)
		altDbTween.tween_property(alt_music_player, "volume_db", 0, 1)
	elif alt_music_player.playing:
		music_players[0] = main_music_player
		dbTween.tween_property(alt_music_player, "volume_db", -80, 1)
		altDbTween.tween_property(main_music_player, "volume_db", 0, 1)
