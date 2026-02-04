extends Control
class_name Game

@onready var panel: Panel = %Panel
@onready var text: RichTextLabel = %Text

var dialogue: Array[String] = [
	"[W] to accelerate\n[S] to brake",
	
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
	"It could be great",
	"It could be miserable",
	"But I know I'll end up home anyway",
	"I don't want to stop driving",
]


func _ready() -> void:
	SignalBus.NextText.connect(show_next_text)
	
	fade()
	show_next_text()

var current_text: int = 0
func show_next_text() -> void:
	text.text = dialogue[current_text]
	current_text += 1

@onready var fade_rect: ColorRect = $FadeRect
func fade(reverse:bool = false) -> void:
	var fade_tween: Tween = get_tree().create_tween()
	match reverse:
		false:
			fade_rect.modulate.a = 1
			fade_tween.tween_property(fade_rect, "modulate:a", 0, 10).set_trans(Tween.TRANS_QUAD)
		true:
			fade_rect.modulate.a = 0
			fade_tween.tween_property(fade_rect, "modulate:a", 1, 10).set_trans(Tween.TRANS_QUAD)
