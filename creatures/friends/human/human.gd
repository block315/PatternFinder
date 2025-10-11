@icon("res://arts/2D/UI/itch.io/IconGodotNode/node_3D/icon_character.png")
extends CharacterBody3D
class_name Human

@export var speed = 1.5

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var voice: AudioStreamPlayer3D = $Voice
@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@onready var foot_step_audio_stream_player_3d: AudioStreamPlayer3D = $FootStepAudioStreamPlayer3D

func _ready():
	foot_step_audio_stream_player_3d.pitch_scale = 0.4
	move(get_tree().get_first_node_in_group("player").global_position)

func _physics_process(_delta: float) -> void:
	if animation_tree.get("parameters/conditions/Walk"):
		if !foot_step_audio_stream_player_3d.playing:
			foot_step_audio_stream_player_3d.play()
		velocity = velocity.move_toward((navigation_agent_3d.get_next_path_position() \
			- global_transform.origin).normalized() * speed, 0.25)
		if velocity:
			look_at(transform.origin + velocity,Vector3.UP)
		else:
			animation_tree.set("parameters/conditions/Stop", true)
			animation_tree.set("parameters/conditions/Walk", false)
		move_and_slide()
	else:
		foot_step_audio_stream_player_3d.stop()
	move(get_tree().get_first_node_in_group("player").global_position)

func move(target_position:Vector3):
	if global_position.distance_to(target_position) > \
		navigation_agent_3d.target_desired_distance:
			animation_tree.set("parameters/conditions/Walk", true)
			animation_tree.set("parameters/conditions/Stop", false)
			navigation_agent_3d.target_position = target_position

func _on_navigation_agent_3d_target_reached() -> void:
	animation_tree.set("parameters/conditions/Stop", true)
	animation_tree.set("parameters/conditions/Walk", false)
