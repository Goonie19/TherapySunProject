extends Node2D

class_name CharacterImpactDetection

var character: CharacterController

func set_dependencies(char: CharacterController):
	character = char

func receive_impact(area: Area2D): 
	if(character):
		character.set_character_state(CharacterState.character_state.Hit)
