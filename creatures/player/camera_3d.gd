extends Camera3D


func camera_shake(shake_time:float, shake_strength:float):
	var _origin_position = position
	var _time := 0.0
	while _time < shake_time-0.2:
		var offset := Vector3(randf_range(-shake_strength, shake_strength), randf_range(-shake_strength, shake_strength), 0.0)
		position += offset
		_time += get_process_delta_time()
		await get_tree().process_frame
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", _origin_position, 0.2)
