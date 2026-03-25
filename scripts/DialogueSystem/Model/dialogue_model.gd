class_name DialogueModel

var dialogue : DialogueData

func setup(d_data : DialogueData):
	dialogue = d_data

func add(dialogue_sentence: sentence_data):
	dialogue.add_sentence(dialogue_sentence)
