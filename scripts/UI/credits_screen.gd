extends Node

class_name CreditsScreen

@export var animator: AnimationPlayer

signal on_fade_completed

func fade() -> void:
	animator.play("Fade_in")

func emit_fade_completed() -> void:
	on_fade_completed.emit()
