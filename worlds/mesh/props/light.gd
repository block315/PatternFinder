extends Node3D
class_name PropLight

@onready var blub_mesh: MeshInstance3D = get_child(0)
@onready var omni_light_3d: OmniLight3D = blub_mesh.get_child(0)
@onready var room: Room = PerodicWarfare.current_room

@export var power := true
var emission_material: int

func _ready() -> void:
	for i in range(blub_mesh.mesh.get_surface_count()):
		if blub_mesh.get_surface_override_material(i).resource_path == "res://worlds/material/light.tres":
			emission_material = i
	print(room)
	room.turn_on_light.connect(light_switch)
	

func _input(event):
	if Input.is_key_pressed(KEY_1):
		light_switch(true)
	elif Input.is_key_pressed(KEY_2):
		light_switch(false)

func light_switch(switch_value:bool=true):
	if switch_value:
		omni_light_3d.visible = true
		blub_mesh.get_surface_override_material(emission_material).emission_enabled = true
	else:
		omni_light_3d.visible = false
		blub_mesh.get_surface_override_material(emission_material).emission_enabled = false
