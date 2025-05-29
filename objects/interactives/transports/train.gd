extends Node3D
class_name Train

@export var speed := 20
var running := false
@onready var camera_3d: Camera3D = $Camera3D

func _process(delta: float) -> void:
	if running:
		position.x += delta * speed

func depart():
	get_parent().animation_player.play("DoorOpen")
	await get_parent().animation_player.animation_finished
	get_parent().get_node("Building").glow(2)
	running = true

func _on_boarding_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		camera_3d.current = true
		depart()

func _on_radar_area_3d_area_entered(area: Area3D) -> void:
	if area.get_parent().get_parent() is Building:
		if area.get_parent().name != get_parent().name:
			get_tree().change_scene_to_file("res://worlds/stages/"+str(area.get_parent().name)
				+"/"+str(area.get_parent().name)+".tscn")

func _unhandled_input(event) -> void:
	if event is InputEventMouseMotion and running:
		camera_3d.rotate_x(-event.relative.y * 0.005)
		camera_3d.rotation.x = clamp(camera_3d.rotation.x, -PI/4, PI/4)
