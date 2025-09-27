extends Node3D
class_name Train

@export var destination : int = 1
@export var speed := 20
var on_board := false
var passenger
@onready var camera_3d: Camera3D = $Camera3D
@onready var path_follow_3d: PathFollow3D = $"../../Building/Path3D/PathFollow3D"
var _player:Player

func _process(delta: float) -> void:
	global_position = path_follow_3d.global_position + Vector3(0,0.5,0)
	global_rotation = path_follow_3d.global_rotation
	var input_dir = Input.get_axis("ui_up", "ui_down")
	if Input.get_axis("ui_up", "ui_down") and on_board:
		path_follow_3d.progress_ratio -= (float(input_dir)*0.001)
	if Input.is_action_just_pressed("crouch") and on_board:
		on_board = false
		passenger.show()
		passenger.camera_3d.current = true

func _on_boarding_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		_player = body
		camera_3d.current = true
		on_board = true
		passenger = body
		body.hide()

func _on_radar_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent().get_parent() is Building and on_board:
		if area.get_parent().visible:
			on_board = false
			passenger.show()
			passenger.camera_3d.current = true
			PerodicWarfare.train_position += 0.2
			PerodicWarfare.change_room(destination, _player.position, _player.rotation, _player.camera_3d.rotation)
			queue_free()

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion and on_board:
		camera_3d.rotate_x(-event.relative.y * 0.005)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, -PI/4, PI/4)
