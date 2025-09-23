extends CharacterBody3D
class_name Player

@export var speed = 5.0
@export var jump_speed = 4.5
@export_range(0,100,1.0) var health: int = 50
@export_range(0,100,1.0) var stamina: float = 50

@onready var hand: Hand = $Camera3D/Hand
@onready var camera_3d: Camera3D = $Camera3D
@onready var electron_shooter: Node3D = $Camera3D/Electron_shooter
@onready var gaze: RayCast3D = $Camera3D/Gaze
@onready var foot_step_audio_stream_player_3d: AudioStreamPlayer3D = $FootStepAudioStreamPlayer3D
@onready var hud: HUD = $Camera3D/HUD

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	camera_3d.make_current()

func _physics_process(delta: float) -> void:
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_speed
		if Input.is_action_pressed("crouch"):
			if camera_3d.position.y > 0.5:
				camera_3d.position.y -= .1
		else:
			if camera_3d.position.y < 1.5:
				camera_3d.position.y += .1
			if Input.is_action_pressed("boost") and stamina > 0:
				speed = 10.0
				stamina -= .1
			else:
				speed = 5.0
	else:
		velocity += get_gravity() * delta
		foot_step_audio_stream_player_3d.stop()
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and visible:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		if !foot_step_audio_stream_player_3d.playing and is_on_floor():
			foot_step_audio_stream_player_3d.play()
	else:
		if foot_step_audio_stream_player_3d.playing:
			foot_step_audio_stream_player_3d.stop()
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
		stamina += .01
	if Input.is_action_just_pressed("ui_page_up"):
		get_tree().change_scene_to_file("res://worlds/stages/"+str(int(get_parent().name)+1)
				+"/"+str(int(get_parent().name)+1)+".tscn")
	move_and_slide()

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.005)
		camera_3d.rotate_x(-event.relative.y * 0.005)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, -PI/4, PI/4)
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
