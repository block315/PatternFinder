extends Node3D
class_name Proposition

@export_multiline var content :String ## Must be one simple sentence.
@export var done: bool = false
@export var require: Array[Proposition]
@export var next: Proposition
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@export var highlight: bool = false :
	set(value):
		find_mesh(self)
		if value:
			for _child:GeometryInstance3D in _geometry_instance3d_childs:
				if _child.get_parent() is Equipment:
					continue
				var _material = ShaderMaterial.new()
				_material.shader = HIGHLIGHT
				_child.material_overlay = _material
		else:
			for _child:GeometryInstance3D in _geometry_instance3d_childs:
				_child.material_overlay = null
		highlight = value

const HIGHLIGHT = preload("res://UI/shaders/highlight.gdshader")

signal success

var _geometry_instance3d_childs = []

func find_mesh(_node):
	_geometry_instance3d_childs.clear()
	for _child in _node.get_children():
		if _child is GeometryInstance3D:
			_geometry_instance3d_childs.append(_child)
		else:
			find_mesh(_child)

func _on_player_interest_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		if highlight:
			highlight = false
		var tween = get_tree().create_tween()
		tween.tween_property(audio_stream_player, "volume_db", 0, 1.0)

func _on_player_interest_area_3d_body_exited(body: Node3D) -> void:
	if body is Player and !highlight:
		if !done:
			highlight = true
		var tween = get_tree().create_tween()
		tween.tween_property(audio_stream_player, "volume_db", -80, 1.0)
