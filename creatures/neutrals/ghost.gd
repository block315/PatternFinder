extends Creature
class_name Ghost

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ghost_material: Material = $Armature/Skeleton3D/Ghost.mesh.surface_get_material(0) :
	set(_material):
		$Armature/Skeleton3D/Ghost.mesh.surface_set_material(0, _material)
		ghost_material = _material


func _physics_process(_delta: float) -> void:
	if velocity.length() == 0:
		move(get_tree().get_first_node_in_group("player").global_position)

	if animation_player.current_animation == "MOVE":
		velocity = velocity.move_toward((navigation_agent_3d.get_next_path_position() \
			- global_transform.origin).normalized() * speed, 0.25)
		move_and_slide()
		look_at(transform.origin + velocity,Vector3.UP)
	else:
		look_at(get_tree().get_first_node_in_group("player").global_position,Vector3.UP)

func move(_target_position:Vector3):
	animation_player.play("MOVE")
	navigation_agent_3d.target_position = _target_position

func stay(duration:float = 0.0):
	animation_player.play("IDLE")
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		animation_player.play("MOVE")

func _on_navigation_agent_3d_target_reached() -> void:
	stay()
