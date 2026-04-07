extends CharacterController

class_name EstefaniaController

func set_character_state(state: CharacterState.character_state) -> void:
	anim_tree["parameters/States/Speak/blend_amount"] = 0
	
	if state == CharacterState.character_state.Speak:
		anim_tree["parameters/States/Speak/blend_amount"] = 1
