extends RigidBody3D
class_name Lemon

@onready var lemon_mesh: MeshInstance3D = $LemonMesh
@export var smashed:= false :
	set(value):
		if value:
			lemon_mesh.scale.y = 0.1
		smashed = value
