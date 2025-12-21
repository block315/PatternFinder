extends Collector
class_name Tongs

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grab_point: Node3D = $GrabPoint

func _ready() -> void:
	animation_player.play("Idle")

func collect(target_position, collider):
	super.collect(target_position, collider)
	animation_player.play("Open")
	var tween:Tween = get_tree().create_tween()
	if (grab_point.global_position - target_position).length() < 1:
		tween.tween_property(self, "global_position", lerp(global_position, target_position, 0.8), 1.0).set_trans(Tween.TRANS_SINE)
		#tween.set_parallel()
		#tween.tween_property(self, "rotation", Vector3(PI,0, 0), 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel(false)
		tween.tween_property(self, "position", Vector3.ZERO, 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel()
		if collider != null and "matter" in collider and collider.matter != null and collider.matter.phase == 0:
			animation_player.play("Grab")
			collider.reparent(grab_point)
			collection = collider.matter
			collider.position = Vector3.ZERO
		else:
			animation_player.play_backwards("Open")
	
