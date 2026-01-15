extends Node3D

@onready var model_holder: MeshInstance3D = $ModelHolder
var previous_position: Vector3
var current_model: MeshInstance3D
@onready var area_3d: Area3D = $Area3D

func _ready() -> void:
	if !visible or model_holder.get_child_count() == 0:
		area_3d.monitoring = false

func _process(delta: float) -> void:
	if visible and model_holder.get_child_count() > 0:
		if model_holder.get_child(0).visible:
			model_holder.get_child(0).rotation.y += delta
		elif current_model != null:
			current_model.rotation.y += delta


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and body.hand.current_equipment is Collector:
		if body.hand.current_equipment.collection != null:
			for _molecule_pack in get_children():
				if _molecule_pack is not Area3D and _molecule_pack is not MeshInstance3D:
					for _molecule in _molecule_pack.get_children():
						if _molecule.visible and _molecule.name == body.hand.current_equipment.collection.name:
							model_holder.get_child(0).hide()
							var tween = get_tree().create_tween()
							previous_position = _molecule.position
							current_model = _molecule
							tween.tween_property(_molecule, "position", Vector3(0,2,0), 1.0)
							#_molecule.global_position = model_holder.global_position + Vector3(0,2,0)
			print(body.hand.current_equipment.collection.name)


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player and !model_holder.get_child(0).visible:
		model_holder.get_child(0).show()
		var tween = get_tree().create_tween()
		tween.tween_property(current_model, "position", previous_position, 1.0)
		current_model = null
