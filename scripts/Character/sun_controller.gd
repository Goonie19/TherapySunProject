extends CharacterController

class_name SunController

func set_character_state(state: CharacterState.character_state) -> void:
	match state:
		CharacterState.character_state.Shocked:
			anim.play("Shocked")
			anim.advance(0)
		CharacterState.character_state.Meditating:
			anim.play("Meditate")
			anim.advance(0)
		CharacterState.character_state.NotBother:
			anim.play("Not Bother")
			anim.advance(0)
