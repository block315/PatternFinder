extends Node3D
class_name Wall

@onready var room:Room = PerodicWarfare.current_room
@onready var mesh: MeshInstance3D = get_child(0)

func _ready() -> void:
	for i in range(mesh.get_surface_override_material_count()):
		if mesh.get_surface_override_material(i).resource_path == "res://worlds/material/T_Decals.tres":
			mesh.get_surface_override_material(i).set("shader_parameter/decals_texture", \
				room.element_decal_png)
