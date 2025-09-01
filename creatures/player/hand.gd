extends Node3D
class_name Hand

@export var current_equipment : Equipment :
	set(new_equipment):
		for _equipment in get_children():
			_equipment.hide()
		if new_equipment != null:
			new_equipment.show()
		current_equipment = new_equipment

@onready var gaze: RayCast3D = $"../Gaze"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var player: Player = $"../.."

func _process(delta: float) -> void:
	if current_equipment != null:
		if Input.is_action_just_pressed("act"):
			if current_equipment is Shooter:
				current_equipment.fire(gaze.get_collision_point())
			elif current_equipment is Collector:
				current_equipment.collect(gaze.get_collision_point(), gaze.get_collider())
			elif current_equipment is Breaker:
				current_equipment.smash(gaze.get_collision_point())
			else:
				current_equipment.use()
		if Input.is_action_just_pressed("switch_down"):
			animation_player.play("switch")
			await animation_player.animation_finished
			current_equipment = get_child((current_equipment.get_index()+1)%(get_child_count()))
			animation_player.play_backwards("switch")
		elif Input.is_action_just_pressed("switch_up"):
			animation_player.play("switch")
			await animation_player.animation_finished
			current_equipment = get_child((current_equipment.get_index()-1)%(get_child_count()))
			animation_player.play_backwards("switch")
		else:
			if animation_player.current_animation != "switch" or !animation_player.is_playing():
				if player.velocity != Vector3.ZERO:
					animation_player.play("walk")
				else:
					animation_player.play("RESET")


func _on_child_exiting_tree(node: Node) -> void:
	if node is Equipment:
		current_equipment = null
