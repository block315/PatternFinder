extends Path3D

@onready var path_follow_3d: PathFollow3D = $PathFollow3D

func _ready() -> void:
	path_follow_3d.progress = PerodicWarfare.train_position

func _process(delta: float) -> void:
	PerodicWarfare.train_position = path_follow_3d.progress
