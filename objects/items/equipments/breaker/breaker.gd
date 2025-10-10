@icon("res://arts/2D/UI/itch.io/IconGodotNode/node_3D/icon_hammer.png")
extends Equipment
class_name Breaker

@export var smash_position: Vector3
@export var smash_rotation: Vector3
@export var smash_speed: float = 0.25

func smash(_target_position:Vector3, _collider):
	var tween = create_tween()
	tween.tween_property(self, "position", smash_position, smash_speed)
	tween.parallel().tween_property(self, "rotation", smash_rotation, smash_speed)
	tween.tween_property(self, "position", handle_position, smash_speed)
	tween.parallel().tween_property(self, "rotation", handle_rotation, smash_speed)
