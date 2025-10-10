extends RigidBody3D
class_name Equipment

@onready var pickup_area_3d: Area3D = $PickupArea3D
@export_enum("Equip:1", "Pick:0", "Drop:-1") var state: int = 0 :
	set(value):
		state = value
		if pickup_area_3d != null:
			match state:
				1:
					freeze = true
					pickup_area_3d.monitoring = false
				0:
					freeze = true
					pickup_area_3d.monitoring = true
				-1:
					freeze = false
					pickup_area_3d.monitoring = false

@export var handle_position:Vector3 = Vector3.ZERO
@export var handle_rotation:Vector3 = Vector3.ZERO ## in Radian

func use(_target_position=Vector3.ZERO):
	pass

func pick_up(player):
	state = 1
	reparent(player.hand,false)
	position = handle_position
	rotation = handle_rotation
	player.hand.current_equipment = self

func drop():
	var _position = global_position
	reparent(get_node("../../../.."), true)
	show()
	state = -1
	global_position = _position
	await get_tree().create_timer(2.0).timeout
	state = 0
	if get_contact_count() == 0:
		freeze = false
		await get_tree().create_timer(1.0).timeout
		freeze = true

func _on_pickup_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and !(get_parent() is Hand):
		if state == 0:
			pick_up(body)

func _on_tree_entered() -> void:
	show()
	freeze = true
