@icon("res://arts/2D/UI/itch.io/IconGodotNode/node_3D/icon_map.png")
extends Node3D
class_name ElementRoom

signal turn_on_light(switch_value)

const PLAYER = preload("uid://b4uw4bgui2o52")

@export var atomic_number: = 1
@export var element_decal_png: CompressedTexture2D
var starting_position: Vector3 = Vector3(0,0,3.0)
var starting_rotation: Vector3 = Vector3(0,0,0)
var starting_view_rotation: Vector3 = Vector3(0,0,0)
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var speaker: Node3D = $Speaker


func _ready():
	# for debug
	if get_tree().get_node_count_in_group("player") < 1:
		var _player = PLAYER.instantiate()
		_player.add_to_group("player")
		get_tree().get_root().add_child.call_deferred(_player)
	$Core.strong_nuclear_force_activate = true
	#$Player.position = starting_position
	#$Player.rotation = starting_rotation
	#$Player/Camera3D.rotation = starting_view_rotation
	$Building.show()
	if PerodicWarfare.access[atomic_number][0]:
		activate_stairs(2)
	if PerodicWarfare.access[atomic_number][1]:
		activate_stairs(3)

func activate_stairs(floor_number: int) -> void:
	if floor_number == 2:
		animation_player.play("AcessSecondFloor")
		speaker.first_stair_audio_stream_player_3d.play()
	elif floor_number == 3:
		animation_player.play("AccessThirdFloor")
		speaker.second_stair_audio_stream_player_3d.play()

func turn_on_lights():
	turn_on_light.emit(true)

func turn_off_lights():
	turn_on_light.emit(false)

func _on_chest_found() -> void:
	if !PerodicWarfare.access[atomic_number][0]:
		PerodicWarfare.access[atomic_number][0] = true
		activate_stairs(2)
