extends Node3D
class_name MainMenu

@onready var spot_light_3d: SpotLight3D = $Camera3D/SpotLight3D
@onready var _3d_cursor: Marker3D = $"3DCursor"
@onready var ray_cast_3d: RayCast3D = $Camera3D/SpotLight3D/RayCast3D

@onready var camera_3d: Camera3D = $Camera3D

const PLAYER = preload("uid://b4uw4bgui2o52")
@onready var ui_audio_stream_player: AudioStreamPlayer = $UIAudioStreamPlayer

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		spot_light_3d.light_color = Color.SKY_BLUE
		if ray_cast_3d.get_collider() is Button3D:
			ray_cast_3d.get_collider().click()
	else:
		spot_light_3d.light_color = Color.WHITE
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_3d_cursor.position = Vector3(_3d_cursor.position.x + event.relative.x * .01, 0, _3d_cursor.position.z + event.relative.y * .01)
		spot_light_3d.look_at(_3d_cursor.global_position)
		if ray_cast_3d.is_colliding():
			if ray_cast_3d.get_collider() is Button3D:
				var _button_3d = ray_cast_3d.get_collider()
				if !_button_3d.hover:
					_button_3d.hover = true
					if not ui_audio_stream_player.playing:
						ui_audio_stream_player.play()
					await get_tree().create_timer(1.0).timeout
					_button_3d.hover = false

func _on_start_button_clicked() -> void:
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(camera_3d, "position", Vector3(-7,3,0), 1.0)
	tween.parallel().tween_property(_3d_cursor, "position", Vector3(-7,0,0), 1.0)

func _on_exit_button_clicked() -> void:
	get_tree().quit()

func _on_config_button_clicked() -> void:
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(camera_3d, "position", Vector3(7,3,0), 1.0)
	tween.parallel().tween_property(_3d_cursor, "position", Vector3(7,0,0), 1.0)

func _on_perodic_warefare_button_clicked() -> void:
	var _player = PLAYER.instantiate()
	get_tree().get_root().add_child(_player)
	PerodicWarfare.change_room(1)
	queue_free()

func _on_soaked_button_clicked() -> void:
	var _player = PLAYER.instantiate()
	get_tree().get_root().add_child(_player)

func _on_home_button_left_clicked() -> void:
	var tween:Tween = get_tree().create_tween()
	tween.tween_property(camera_3d, "position", Vector3(0,3,0), 1.0)
	tween.parallel().tween_property(_3d_cursor, "position", Vector3(0,0,0), 1.0)
