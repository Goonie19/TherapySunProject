class_name dialogue_presenter

var view: DialogueView
var model: DialogueModel

var nextSentence: bool
var sentenceCompleted: bool

func _init(copy_view: DialogueView, model_copy: DialogueModel):
	view = copy_view
	model = model_copy
	
	connect_view()
	
func connect_view():
	#placeholder
	nextSentence = false
