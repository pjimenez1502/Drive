extends Node3D
class_name PlayerCamera

@onready var player_car: Car = $"../.."

func _process(delta: float) -> void:
	global_position = player_car.global_position
