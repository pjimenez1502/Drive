extends Area3D
class_name PlayerTrigger

func _on_area_entered(area: Area3D) -> void:
	SignalBus.NextText.emit()
