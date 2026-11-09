extends Action

class_name FadeCreditsScreenAction

var fade_panel: CreditsScreen

func do_action() -> void:
	fade_panel.fade()
	await fade_panel.on_fade_completed
	on_action_finished.emit()

func set_dependencies(panel : CreditsScreen) -> void:
	fade_panel = panel
