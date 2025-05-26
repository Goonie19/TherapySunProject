class_name dialogue_data
extends Resource


@export var dialogue_id: String
@export var sentences: Array[sentence_data]

func _init(id: String, sentence_array: Array[sentence_data]):
	dialogue_id = id
	sentences = sentence_array
	
func add_sentence(sentence : sentence_data):
	sentences.append(sentence)
