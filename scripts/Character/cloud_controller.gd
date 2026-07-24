extends Node2D

class_name CloudController

@export var cloud_canvas_item : CanvasItem

func fade_out() -> void:
	var tween = cloud_canvas_item.create_tween()
	await tween.tween_property(cloud_canvas_item, "modulate", Color(1,1,1,0), 1)
