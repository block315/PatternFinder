extends Path3D

@export var train_number: int = 0
@onready var path_follow_3d: PathFollow3D = $PathFollow3D
@onready var building: PeriodicBuilding = $"../.."

func _ready() -> void:
	var _curve = Curve3D.new()
	for _track in get_children():
		if _track is PathFollow3D:
			continue
		var _markors = []
		for _markor in _track.get_children():
			_markors.append((_markor.global_position-building.global_position)/2.5)
		if _curve.get_closest_point(_markors.back()).distance_to(_markors.back()) \
			< _curve.get_closest_point(_markors.front()).distance_to(_markors.front()):
			_markors.reverse()
		for _points in _markors:
			_curve.add_point(_points)
	curve = _curve
	path_follow_3d.progress = PerodicWarfare.train_position[train_number]

func _process(_delta: float) -> void:
	PerodicWarfare.train_position[train_number] = path_follow_3d.progress
