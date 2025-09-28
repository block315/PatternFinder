extends Node3D
class_name EquationScale

## change by 0.01
@export var scale_rotation: float = 0 :
	set(value):
		value = clamp(value, -PI/6, PI/6)
		scale_rotation = value
		beam_origin.rotation.z = scale_rotation

@onready var left_origin: RigidBody3D = $Pillar/BeamOrigin/LeftOrigin
@onready var right_origin: Node3D = $Pillar/BeamOrigin/RightOrigin
@onready var beam_origin: Node3D = $Pillar/BeamOrigin
@onready var left_glue: Node3D = $Pillar/BeamOrigin/LeftGlue
@onready var right_glue: Node3D = $Pillar/BeamOrigin/RightGlue

func _process(_delta: float) -> void:
	if Input.is_key_label_pressed(KEY_0):
		scale_rotation += 0.05
	if Input.is_key_label_pressed(KEY_1):
		scale_rotation -= 0.05

func _physics_process(_delta: float) -> void:
	var tension_left :Vector3 = left_glue.global_position - left_origin.global_position
	var tension_right :Vector3 = right_glue.global_position - right_origin.global_position
	tension_left *= 1000
	tension_right *= 1000
	left_origin.apply_force(tension_left)
	right_origin.apply_force(tension_right)
	
	left_origin.apply_torque(-left_origin.global_rotation)
	right_origin.apply_torque(-right_origin.global_rotation)
