extends Node3D
class_name Room

signal turn_on_light(switch_value)

@export var atomic_number :int = 1
@export var element_decal_png :CompressedTexture2D
@export var stair_access :Array[bool] = [false, false]
@export var starting_position: Vector3 = Vector3(0,0,3.0)

@onready var building: Building = $Building
@onready var animation_player :AnimationPlayer = $AnimationPlayer
@onready var core: Core = $Core
@onready var speaker: Node3D = $Speaker


func _ready():
	core.strong_nuclear_force_activate = true
	$Player.position = starting_position
	building.show()

func activate_stairs(floor_number: int) -> void:
	match floor_number:
		1:
			pass
		2:
			animation_player.play("AcessSecondFloor")
			speaker.first_stair_audio_stream_player_3d.play()
		3:
			animation_player.play("AccessThirdFloor")

func turn_on_lights():
	turn_on_light.emit(true)

func turn_off_lights():
	turn_on_light.emit(false)

func _input(event):
	if Input.is_key_label_pressed(KEY_0):
		activate_stairs(2)
	if Input.is_key_label_pressed(KEY_9):
		activate_stairs(3)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	speaker.first_stair_audio_stream_player_3d.stop()
