extends Node
class_name WallWithHeat

@onready var wall_mesh:MeshInstance3D = get_child(0)
@export_color_no_alpha var wall_color: Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wall_mesh.material_overlay


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
