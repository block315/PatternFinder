extends Node3D
class_name Elevator

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var door_open_time: int = 3
var open = false
@export var player_on_board = false
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var motor_audio_stream_player_3d: AudioStreamPlayer3D = $MotorAudioStreamPlayer3D

@export_category("Destination")
@export var upstairs : int = 0
@export var downstairs : int = 0

func _ready() -> void:
	pass
	#door_close()

var _player:Player

func door_open() -> void:
	open = true
	animation_player.play("DoorOpen")
	audio_stream_player_3d.play()
	await get_tree().create_timer(door_open_time).timeout
	door_close()

func door_close() -> void:
	open = false
	animation_player.play_backwards("DoorOpen")
	audio_stream_player_3d.play()
	await animation_player.animation_finished

func _on_door_sensor_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and !open:
		door_open()

func elevator_switch(up:bool):
	#print("using eleavtor : ", up)
	if up and upstairs != 0:
		get_tree().get_first_node_in_group("player").camera_3d.camera_shake(2.0, 0.1)
		await get_tree().create_timer(2.0).timeout
		motor_audio_stream_player_3d.play()
		PerodicWarfare.change_room(upstairs)
	elif downstairs != 0:
		#print("going downstairs")
		motor_audio_stream_player_3d.play()
		get_tree().get_first_node_in_group("player").camera_3d.camera_shake(2.0, 0.1)
		await get_tree().create_timer(2.0).timeout
		PerodicWarfare.change_room(downstairs)

func _on_elevator_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		_player = body
		player_on_board = true
		_player.hud.switch.connect(elevator_switch)

func _on_elevator_area_3d_body_exited(body: Node3D) -> void:
	if body is Player and player_on_board:
		player_on_board = false
		_player.hud.switch.disconnect(elevator_switch)
