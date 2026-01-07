extends Shooter
class_name ElectronShooter

const ELECTRON = preload("res://objects/cores/electron.tscn")
@onready var nozzle: Marker3D = $Nozzle

func fire(target_postion:Vector3 = Vector3.ZERO):
	var _electon = ELECTRON.instantiate()
	PerodicWarfare.current_room.add_child(_electon)
	_electon.global_position = nozzle.global_position
	_electon.shoot(target_postion)
