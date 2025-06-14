class_name dialogue_presenter

var view: DialogueView
var model: DialogueModel

var nextSentence: bool
var sentenceCompleted: bool

func _init(copy_view: DialogueView, data: dialogue_data):
	view = copy_view
	model = DialogueModel.new()
	model.setup(data)
	
	connect_view()
	
func connect_view():
	view.on_button_pass_pressed.connect(go_to_next_sentence)
	view.on_options_hidden.connect(go_to_next_sentence)
	view.on_dialogue_hidden.connect(finish_dialogue)


func go_to_next_sentence():
	if not sentenceCompleted:
		sentenceCompleted = true
	else:
		nextSentence = true

func start_dialogue():
	view.show_dialogue_panel()
	
	update_text_async()

func finish_dialogue():
	nextSentence = false
	sentenceCompleted = false

func choose_answer(i: int):
	view.hide_dialogue_options()

func update_text_async() -> void:
	var i: int = 0
	var j: int = 0
	while i < model.dialogue.sentences.size():
		sentenceCompleted = false
		nextSentence = false
		
		view.set_sentence(model.dialogue.sentences[i])
		
		j = 0
		while j < model.dialogue.sentences[i].dialogue_string.length() and not sentenceCompleted:
			update(j)
			view.timer.start(0.01)
			await view.timer.timeout
			j += 1
		
		update(model.dialogue.sentences[i].dialogue_string.length())
		
		if model.dialogue.sentences[i].answers.size() > 0:
			view.show_dialogue_options(model.dialogue.sentences[i].answers)
		
		sentenceCompleted = true
		
		while not nextSentence:
			view.timer.start(0.001)
			await view.timer.timeout
		
		i += 1
	
	view.hide_dialogue_panel()

func update(index):
	view.update_text(index)
