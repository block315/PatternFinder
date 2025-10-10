extends Path3D

@onready var path_follow_3d: PathFollow3D = $PathFollow3D
@onready var rail_way: Node3D = $"../RailWay"
@onready var building: PeriodicBuilding = $".."

func _ready() -> void:
	var _curve = Curve3D.new()
	for _tracks in rail_way.get_children():
		var _markors = []
		for _markor in _tracks.get_children():
			_markors.append((_markor.global_position-building.global_position)/2.5)
		if _curve.get_closest_point(_markors.back()).distance_to(_markors.back()) \
			< _curve.get_closest_point(_markors.front()).distance_to(_markors.front()):
			_markors.reverse()
		for _points in _markors:
			_curve.add_point(_points)
	curve = _curve
	for i in range(curve.point_count):
		print(curve.get_point_position(i))
	path_follow_3d.progress = PerodicWarfare.train_position

func _process(_delta: float) -> void:
	PerodicWarfare.train_position = path_follow_3d.progress
