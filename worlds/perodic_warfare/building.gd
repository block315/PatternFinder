extends Node3D
class_name Building

const GLOW_BLOCK = preload("res://objects/materials/Glow.tres")
@onready var atomic_number = get_parent().atomic_number
@onready var current_room = get_child(atomic_number-1)

func _ready() -> void:
	current_room.hide()

func glow(floor:int):
	var glow_block: MeshInstance3D = get_node(str(floor))
	glow_block.set_surface_override_material(0,GLOW_BLOCK)
