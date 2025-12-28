extends Node
class_name WallWithHeat

@onready var wall_mesh:MeshInstance3D = get_child(0)
@export_color_no_alpha var wall_color: Color

func _ready() -> void:
	var _material:ORMMaterial3D = wall_mesh.get_active_material(0).duplicate()
	_material.emission_enabled = true
	_material.emission = wall_color
	wall_mesh.material_override = _material
