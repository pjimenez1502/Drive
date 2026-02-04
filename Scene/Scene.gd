extends Node3D
class_name SceneManager

@onready var STARTROAD: RoadPoint = $"Road/RoadManager/Road_001/RoadPoint-01"
@onready var player_car: Car = $PlayerCar

func _ready() -> void:
	var start_lane: RoadLane = STARTROAD.prior_seg.get_lanes()[1]
	player_car.agent.assign_lane(start_lane)
	var rand_pos: Vector3 = start_lane.curve.sample_baked(0)
	player_car.global_transform.origin = start_lane.to_global(rand_pos)
