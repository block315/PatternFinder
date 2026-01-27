extends Node3D


func _ready() -> void:
	seed(PerodicWarfare.current_room.atomic_number)
	for _glass_ware in get_children():
		if _glass_ware.get_child_count() > 0:
			var liquid:MeshInstance3D = _glass_ware.get_child(0)
			var _material = StandardMaterial3D.new()
			_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			_material.albedo_color = Color(randf(), randf(), randf(), 1.0-randf()*.5)
			liquid.material_override = _material
