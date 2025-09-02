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

func collect(target_position:Vector3, collider):
	super.collect(target_position, collider)
	liquid_color = liquid_color
	if (global_position - target_position).length() < 1:
		global_position = target_position
		rotation = Vector3(0,0, -PI)
	await get_tree().create_timer(1.0).timeout
	position = Vector3.ZERO
	rotation = Vector3.ZERO
	if "matter" in collider and collider.matter != null:
		if collider.matter.phase == 2:
			rotation = Vector3(0,0, -PI)
			collection = collider.matter
		if collider.matter.phase == 1:
			collection = collider.matter
			liquid.show()

func _process(delta: float) -> void:
	if collection == null and liquid.visible:
		liquid.hide()
