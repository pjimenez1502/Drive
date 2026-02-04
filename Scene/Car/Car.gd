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

func _physics_process(delta: float) -> void:
	update_velocity(delta)
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

func car_volume() -> void:
	audio_stream_player_3d.volume_db = -40 + (30 * velocity/max_speed)
