extends CharacterController

class_name SunController

@export var hit_timer : Timer
@export var hit_cooldown: float = 0.5

signal on_hit

func set_character_state(state: CharacterState.character_state) -> void:
	#Something is happening that when is hit, character is not returning to previous state
	match state:
		CharacterState.character_state.Sad:
			play_animation("Sad")
		CharacterState.character_state.Shocked:
			play_animation("Shocked")
		CharacterState.character_state.Meditating:
			play_animation("Meditate")
		CharacterState.character_state.NotBother:
			play_animation("Not Bother")
		CharacterState.character_state.Angry:
			play_animation("Angry")
		CharacterState.character_state.AngryMeditating:
			play_animation("AngryMeditate")
		CharacterState.character_state.SadMeditating:
			play_animation("SadMeditate")
	current_state = state

func Hit() -> void:
	on_hit.emit()
	play_animation("Hit")
	hit_timer.start(hit_cooldown)
	await hit_timer.timeout
	set_character_state(current_state)

func play_animation(animation: String) -> void:
	anim.play(animation)
	anim.advance(0)
