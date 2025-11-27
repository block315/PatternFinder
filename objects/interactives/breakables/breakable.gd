extends Node
class_name Breakable

@export var hard := false
@export var smashed := false :
	set(value):
		if value:
			for _node in get_children():
				if _node is MeshInstance3D:
					_node.scale.y = 0.1
					_node.rotation = Vector3.ZERO
		smashed = value
