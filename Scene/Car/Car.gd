extends Node3D
class_name Car

@onready var agent: RoadLaneAgent = %RoadLaneAgent
@onready var audio_stream_player_3d: AudioStreamPlayer = $AudioStreamPlayer
var velocity: float = 30

const max_speed: float = 30

const DEBUG_OUT: bool = true

func _ready() -> void:
	if DEBUG_OUT:
		print("Agent state: %s par, %s lane, %s manager" % [
			agent.actor, agent.current_lane, agent.road_manager
		])
	fade_car_vol_limit(0)

func _physics_process(delta: float) -> void:
	update_velocity(delta)
	align_to_road()
	
	car_volume()
	#print(velocity)
	var next_pos: Vector3 = agent.move_along_lane(velocity * delta)
	global_transform.origin = next_pos

func update_velocity(delta: float) -> void:
	if Input.is_action_pressed("Forward"):
		velocity = lerp(velocity, max_speed, delta * 0.6)
		return
	if Input.is_action_pressed("Brake"):
		velocity = lerp(velocity, 0.0, delta * 1)
		return
	
	velocity = lerp(velocity, 0.0, delta * 0.2)
	#velocity = lerp(velocity, max_speed, delta * 0.6)

## ALIGN
func align_to_road() -> void:
	var orientation:Vector3 = agent.test_move_along_lane(0.05)
	if ! global_transform.origin.is_equal_approx(orientation):
		look_at(orientation, Vector3.UP)


## AUDIO
func fade_car_vol_limit(limit: float) -> void:
	var car_vol_tween: Tween = get_tree().create_tween()
	car_vol_tween.tween_method(set_car_vol_limit, car_volume_limit, limit, 6)
	
var car_volume_limit: float = -60
func set_car_vol_limit(value: float) -> void:
	car_volume_limit = value

func car_volume() -> void:
	audio_stream_player_3d.volume_db = clampf(-40 + (30 * velocity/max_speed), -60, car_volume_limit) 
