extends RigidBody3D
class_name Lemon

@onready var lemon_mesh: MeshInstance3D = $LemonMesh
@export var smashed:= false :
	set(value):
		if value:
			lemon_mesh.scale.y = 0.1

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
