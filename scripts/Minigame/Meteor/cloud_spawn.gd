extends Node2D

class_name CloudSpawn

@export var position_associated: MeteorSpawnSequenceData.METEOR_SPAWN_POSITIONS

signal on_shoot

func shoot() -> void:
	visible = true
	
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.04, 0.04), 0.3)
	tween.set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	
	await get_tree().create_timer(0.2).timeout
	
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.06, 0.06), 0.3)
	await tween.finished
	
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.04, 0.04), 0.1)
	await tween.finished

	on_shoot.emit()
	
	await get_tree().create_timer(0.5).timeout
	
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.001, 0.001), 0.5)
	tween.set_ease(Tween.EASE_OUT_IN)
	await tween.finished
	
	queue_free()
