extends Area3D
class_name Equipment

@export_enum("Equip:1", "Pick:0", "Drop:-1") var state: int = 0 :
	set(value):
		print(self.name, " : ", state)
		state = value
		match state:
			1:
				monitoring = false
			0:
				monitoring = true
			-1:
				monitoring = false

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
	state = -1
	reparent(get_node("../../../.."), true)
	show()
	position.y = floor(position.y/2.0)*2
	await get_tree().create_timer(3.0).timeout
	state = 0

func _on_body_entered(body: Node3D) -> void:
	print(self, "body detected!")
	if body is Player and !(get_parent() is Hand):
		if state == 0:
			pick_up(body)
