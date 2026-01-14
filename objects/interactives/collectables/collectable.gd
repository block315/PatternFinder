extends Node3D
class_name Collectable

@export var matter: Matter

signal picked
signal dropped

func _ready() -> void:
	picked.connect(_on_picked)
	dropped.connect(_on_dropped)

func _on_picked():
	for _meshinstance3d in get_children():
		if _meshinstance3d is MeshInstance3D:
			_meshinstance3d.mesh.material.no_depth_test = true

func _on_dropped() -> void:
	for _meshinstance3d in get_children():
		if _meshinstance3d is MeshInstance3D:
			_meshinstance3d.mesh.material.no_depth_test = false
