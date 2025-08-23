extends Proposition

func _ready() -> void:
	for _ballon in get_children():
		if _ballon.name.begins_with("Ballon"):
			_ballon.position.y = lerp(_ballon.position.y, 4.5, 0.1)

func _process(delta: float) -> void:
	pass
