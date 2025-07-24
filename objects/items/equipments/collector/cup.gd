extends Collector
class_name Cup

func collect(target_position:Vector3, collider):
	super.collect(target_position, collider)
	if (global_position - target_position).length() < 1:
		global_position = target_position
		rotation = Vector3(0,0, -PI)
	await get_tree().create_timer(1.0).timeout
	position = Vector3.ZERO
	rotation = Vector3.ZERO
	if "matter" in collider and collider.matter != null:
		rotation = Vector3(0,0, -PI)
		collection = collider.matter
