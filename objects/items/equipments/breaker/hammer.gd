extends Breaker
class_name Hammer

func smash(target_position:Vector3, collider):
	var swing_tween = create_tween()
	swing_tween.tween_property(self, "rotation:x", 190, 0.25)
	swing_tween.tween_property(self, "rotation:x", 0.417, 0.25)
	#rotate_object_local(Vector3.UP, 90)
	if "smashed" in collider:
		collider.smashed = true
