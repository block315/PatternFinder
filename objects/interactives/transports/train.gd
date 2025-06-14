extends Node3D
class_name Train

@export var speed := 20
var on_board := false
var passenger
@export var destination : PackedScene
@onready var camera_3d: Camera3D = $Camera3D

func _process(delta: float) -> void:
	var input_dir = Input.get_axis("ui_up", "ui_down")
	if Input.get_axis("ui_up", "ui_down") and on_board:
		if rotation.y > 0:
			position.x += input_dir * speed / 50.0
		else:
			position.x -= input_dir * speed / 50.0
	if Input.is_action_just_pressed("crouch") and on_board:
		on_board = false
		print(passenger)
		passenger.show()
		passenger.camera_3d.current = true

func _on_boarding_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		camera_3d.current = true
		on_board = true
		passenger = body
		body.hide()

func _on_radar_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent().get_parent() is Building:
		if area.get_parent().visible:
			print("going to next room")
			get_tree().change_scene_to_packed(destination)

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion and on_board:
		camera_3d.rotate_x(-event.relative.y * 0.005)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, -PI/4, PI/4)
