extends Node3D
class_name Elevator

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var door_open_time: int = 3
var open = false

@export var upstairs : PackedScene
@export var downstairs : PackedScene

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func door_open():
	open = true
	animation_player.play("DoorOpen")
	await get_tree().create_timer(door_open_time).timeout
	door_close()

func door_close():
	open = false
	animation_player.play_backwards("DoorOpen")
	go_downstairs()

func _on_door_sensor_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and !open:
		door_open()

func go_downstairs():
	if downstairs != null:
		get_tree().change_scene_to_packed(downstairs)

func go_upstairs():
	pass
