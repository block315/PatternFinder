extends CharacterBody3D
class_name Creature

@export var target_position: Vector3
@export var patrol_position: Array[Vector3]
@export var speed := 3.0
@export var attention: bool = false

func move(_target_position:Vector3):
	pass
