extends RigidBody3D
class_name CoreNeutronModel

@onready var particle_scale: float

@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape_3d.scale *= particle_scale
	mesh_instance_3d.scale *= particle_scale



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
