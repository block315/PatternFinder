extends Collector
class_name Cup

@onready var liquid: MeshInstance3D = $Liquid
@export var liquid_color: Color = Color.WHITE :
	set(value):
		var _material = StandardMaterial3D.new()
		if liquid != null:
			_material.albedo_color = value
			liquid.material_override = _material
		liquid_color = value
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

func collect(target_position:Vector3, collider):
	super.collect(target_position, collider)
	liquid_color = liquid_color
	var tween:Tween = get_tree().create_tween()
	audio_stream_player_3d.play()
	if (global_position - target_position).length() < 1:
		tween.tween_property(self, "global_position", target_position, 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel()
		tween.tween_property(self, "rotation", Vector3(0,0, PI), 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel(false)
		tween.tween_property(self, "position", Vector3.ZERO, 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel()
		if collider != null and "matter" in collider and collider.matter != null and collider.matter.phase == 1:
			tween.tween_property(self, "rotation", handle_rotation, 1.0).set_trans(Tween.TRANS_SINE)
	var display_liquid = func(idx):
		if idx == 0:
			if collider != null and "matter" in collider and collider.matter != null:
				if collider.matter.phase == 2:
					rotation = Vector3(0,0, -PI)
					collection = collider.matter
				if collider.matter.phase == 1:
					collection = collider.matter
					liquid.show()
		else:
			audio_stream_player_3d.stop()
	tween.step_finished.connect(display_liquid)

func _process(_delta: float) -> void:
	if collection == null:
		if liquid.visible:
			liquid.hide()
		if state == 1:
			rotation = handle_rotation
