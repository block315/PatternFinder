extends Path3D

@onready var path_follow_3d: PathFollow3D = $PathFollow3D

func _ready() -> void:
	path_follow_3d.progress_ratio = 0
