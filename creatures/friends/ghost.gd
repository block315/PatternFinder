extends Creature
class_name Ghost

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: Player = get_tree().get_first_node_in_group("player")
#@onready var ghost_material: Material = $Armature/Skeleton3D/Ghost.mesh.surface_get_material(0) :
	#set(_material):
		#$Armature/Skeleton3D/Ghost.mesh.surface_set_material(0, _material)
		#ghost_material = _material

func _physics_process(_delta: float) -> void:
	if player != null:
		if animation_player.current_animation == "Walk":
			velocity = velocity.move_toward((navigation_agent_3d.get_next_path_position() \
				- global_transform.origin).normalized() * speed, 0.25)
			move_and_slide()
			#look_at(transform.origin + velocity, Vector3.UP)
			look_at(transform.origin + velocity, Vector3.UP)
		elif animation_player.current_animation == "Idle":
			if attention:
				look_at(player.global_position,Vector3.UP)
			else:
				if randf() > 0.1:
					await get_tree().create_timer(randi()%10).timeout
					move(patrol_position.pick_random())
				else:
					dance(1.0)
	else:
		player = get_tree().get_first_node_in_group("player")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_J):
		animation_player.play("Walk")
	elif Input.is_key_pressed(KEY_K):
		animation_player.play("Jump")
	elif Input.is_key_pressed(KEY_L):
		animation_player.play("Dance")
	elif Input.is_key_pressed(KEY_M):
		yes(1.0)
	elif Input.is_key_pressed(KEY_N):
		no(1.0)
	elif Input.is_key_pressed(KEY_P):
		fade()

func move(_target_position:Vector3):
	animation_player.play("Walk")
	navigation_agent_3d.target_position = _target_position

func stay(duration:float = 0.0):
	animation_player.play("Idle")
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		#animation_player.play("Walk")

func _on_navigation_agent_3d_target_reached() -> void:
	stay()

func yes(duration:float = 1.0):
	animation_player.play("Yes")
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		animation_player.play("Idle")

func no(duration:float = 1.0):
	animation_player.play("No")
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		animation_player.play("Idle")

func fade(fade_duration:float = 1.0, duration:float = 1.0):
	var tween = get_tree().create_tween()
	tween.tween_property($MonsterArmature/Skeleton3D.get_child(0), "transparency", 1.0, fade_duration)
	tween.tween_interval(duration)
	tween.tween_property($MonsterArmature/Skeleton3D.get_child(0), "transparency", 0.0, fade_duration)

func dance(duration:float=0.0):
	animation_player.play("Dance")
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		animation_player.play("Idle")
