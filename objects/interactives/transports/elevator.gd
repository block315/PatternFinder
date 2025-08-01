extends Node3D
class_name Elevator


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var door_open_time: int = 3
var open = false

@export_category("Destination")
@export var upstairs : int = 0
@export var downstairs : int = 0

var _player:Player

func door_open() -> void:
	open = true
	animation_player.play("DoorOpen")
	await get_tree().create_timer(door_open_time).timeout
	door_close()

func door_close() -> void:
	open = false
	animation_player.play_backwards("DoorOpen")
	await animation_player.animation_finished
	go_downstairs()

func _on_door_sensor_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and !open:
		_player = body
		door_open()

func go_downstairs() -> void:
	if downstairs != 0:
		PerodicWarfare.change_room(downstairs, _player.position, _player.rotation)

func go_upstairs() -> void:
	if upstairs != 0:
		PerodicWarfare.change_room(upstairs, Vector3(0,0,13))
