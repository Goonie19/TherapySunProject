class_name dialogue_model

var dialogue : dialogue_data

func setup(d_data : dialogue_data):
	dialogue = d_data
	
func add(dialogue_sentence: sentence_data):
	dialogue.add_sentence(dialogue_sentence)
