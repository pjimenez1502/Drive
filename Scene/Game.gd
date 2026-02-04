extends Control
class_name Game

var dialogue: Array[String] = [
	"As the kids nowaday say: [W] to accelerate, [S] to brake",
	
	"You are not really going anywhere",
	"I guess you are just driving away",
	"Not away from something, or someone",
	"Maybe you are just driving",
	"And maybe that is the point",
	"That there is no point",
	
	"And that is what makes it beautiful",
	"And that is what makes it sad",
	
	"Do you look forward to seing what's up ahead?",
	"I do",
	
	"I don't know if I will like it",
	"Maybe it won't be like I imagine",
	"It could be great!",
	"It could be miserable",
	"But I know I'll end up home anyway",
	
	"I don't want to stop driving",
]

var current_text: int = 0
func show_next_text() -> void:
	dialogue[current_text]
	current_text += 1
