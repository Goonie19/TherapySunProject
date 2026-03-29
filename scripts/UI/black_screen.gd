extends Node

class_name BlackScreen

@export var fade_color: ColorRect

signal on_fade_completed

func fade(target_alpha: float, time: float) -> void:
	var tween = create_tween()
	tween.tween_property(fade_color, "color:a", target_alpha, time)
	await tween.finished
	on_fade_completed.emit()
