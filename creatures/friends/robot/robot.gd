extends CharacterBody3D
class_name Robot

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var animation_tree: AnimationTree = $AnimationTree

@export var speed = 3.0
var moving: bool

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_F1):
		animation_tree.set("parameters/conditions/greeting", true)
		await animation_tree.animation_finished
		animation_tree.set("parameters/conditions/greeting", false)
	elif Input.is_key_pressed(KEY_F2):
		move($"../Player".global_position)

func _physics_process(delta: float) -> void:
	if moving:
		velocity = velocity.move_toward((navigation_agent_3d.get_next_path_position() \
			- global_transform.origin).normalized() * speed, 0.25)
		move_and_slide()
		if velocity:
			look_at(transform.origin + velocity,Vector3.UP)
			animation_tree.set("parameters/conditions/walking", true)
			animation_tree.set("parameters/conditions/stop", false)
		else:
			animation_tree.set("parameters/conditions/stop", true)
			animation_tree.set("parameters/conditions/walking", false)

func move(target_position:Vector3):
	moving = true
	navigation_agent_3d.target_position = target_position


func _on_navigation_agent_3d_target_reached() -> void:
	moving = false
