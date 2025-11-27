extends RigidBody3D
class_name Button3D

signal clicked

@export var hover: bool :
	set(value):
		if value:
			apply_central_force(-get_gravity()*20)
		else:
			gravity_scale = 1
		hover = value

func click():
	clicked.emit()
