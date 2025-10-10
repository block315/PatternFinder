extends Breaker
class_name Hammer

func smash(target_position:Vector3, collider):
	super.smash(target_position, collider)
	if "smashed" in collider:
		collider.smashed = true
