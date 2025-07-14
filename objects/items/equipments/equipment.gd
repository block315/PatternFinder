extends Area3D
class_name Equipment

@export_enum("Equip:1", "Pick:0", "Drop:-1") var state: int = -1
@export var handle_position:Vector3 = Vector3.ZERO
@export var handle_rotation:Vector3 = Vector3.ZERO ## in Radian

func use(target_position=Vector3.ZERO):
	pass

func pick_up(player):
	reparent(player.hand,false)
	position = handle_position
	rotation = handle_rotation
	player.hand.current_equipment = self
	monitoring = false
	#print("disable monitoring")
	state = 1

func drop():
	monitoring = true
	state = 0

func _on_body_entered(body: Node3D) -> void:
	if body is Player and !(get_parent() is Hand) :
		if state == -1:
			pick_up(body)
			#print(body.hand.get_children())
			state = 0

func _on_body_exited(body: Node3D) -> void:
	if body is Player:
		if state == 0:
			state = -1
	#print("Dropping", self, monitoring)
