
class_name dialogue_data

var dialogue_id: String
var sentences: Array[sentence_data]

func _init(id: String, sentence_array: Array[sentence_data]):
	dialogue_id = id
	sentences = sentence_array
	
func add_sentence(sentence : sentence_data):
	sentences.append(sentence)
