extends Robot
class_name MikeRobot

@export var robot_color: Color = Color.WHITE
@onready var mesh: MeshInstance3D = $RobotArmature/Skeleton3D/Mike

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _material:StandardMaterial3D = mesh.get_active_material(0)
	print(_material)
	_material.albedo_color = robot_color
	mesh.set_surface_override_material(0, _material)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
