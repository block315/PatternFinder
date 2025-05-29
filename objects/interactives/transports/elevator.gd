extends Node3D
class_name Elevator

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var door_opened: bool = false

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_7):
		door_open()
	elif Input.is_key_pressed(KEY_6):
		door_close()

func door_open():
	animation_player.play("DoorOpen")

func door_close():
	animation_player.play_backwards("DoorOpen")
