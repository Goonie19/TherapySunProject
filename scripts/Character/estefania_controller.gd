extends CharacterController

class_name EstefaniaController

@export var head_sprite: Sprite2D
@export var orbital_sprite: Sprite2D

@export var rotation_speed: float = 5

func _process(delta: float) -> void:
	head_sprite.rotate(rotation_speed * delta)
	orbital_sprite.rotate(-rotation_speed * delta)

func set_character_state(state: CharacterState.character_state) -> void:
	if state == CharacterState.character_state.Speak:
		anim.play("Speak")
	else: 
		anim.play("Iddle")
