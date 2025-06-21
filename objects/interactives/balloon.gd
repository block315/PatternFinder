extends RigidBody3D
class_name Ballon

@onready var area_3d: Area3D = $Area3D

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		if linear_velocity < Vector3(0.01,0.01,0.01):
			apply_central_force(Vector3(0,-30,0))
