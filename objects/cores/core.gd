extends Node3D
class_name Core

@export var atomic_number:int = 1
@export var neutron:Array[int] = [1]
@export var electron:int = 1
@export var strong_nuclear_force:int = 50
@export_range(0, 1.0, 0.1) var particle_size:float = 1.0

@onready var isotope_timer: Timer = $IsotopeTimer
@onready var isotope_audio_stream_player_3d: AudioStreamPlayer3D = $IsotopeAudioStreamPlayer3D
@onready var nucleus_center_point: OmniLight3D = $NucleusHolder/NucleusCenterPoint
@onready var nucleus_holder: MeshInstance3D = $NucleusHolder
var current_neutron_index:int = 0
var inital_particle_spread: float = 2.0

@onready var strong_nuclear_force_activate: bool = false :
	set(value):
		if value:
			electron_init()
		strong_nuclear_force_activate = value

const NEUTRON = preload("res://objects/cores/neutron.tscn")
const PROTON = preload("res://objects/cores/proton.tscn")
const ELECTRON = preload("res://objects/cores/electron.tscn")

func _ready() -> void:
	if get_parent() is ElementRoom:
		atomic_number = get_parent().atomic_number
		electron = get_parent().atomic_number
	particle_size = 1.01**(-atomic_number)
	if neutron.size() == 1:
		isotope_timer.stop()
	_on_isotope_timer_timeout()



func _physics_process(_delta: float) -> void:
	if strong_nuclear_force_activate:
		for _particle in nucleus_holder.get_children():
			if _particle is RigidBody3D:
				var _force:Vector3 = nucleus_center_point.global_position \
					- _particle.global_position
				if _force.length() > .1:
					_particle.apply_central_force(_force.normalized()*strong_nuclear_force)

func _on_isotope_timer_timeout() -> void:
	isotope_audio_stream_player_3d.play()
	for _particle in nucleus_holder.get_children():
		if _particle is RigidBody3D:
			_particle.queue_free()
	neutron_init()
	proton_init()
	await get_tree().create_timer(0.5).timeout
	for _particle in nucleus_holder.get_children():
		if _particle is RigidBody3D:
			_particle.show()
	for _electron in nucleus_center_point.get_children():
		_electron.electron_basis_randomize()
	current_neutron_index = (current_neutron_index + 1) % neutron.size()

func proton_init():
	for i in range(atomic_number):
		var _proton = PROTON.instantiate()
		_proton.particle_scale = particle_size
		_proton._ready()
		_proton.hide()
		_proton.position.x = randf_range(-inital_particle_spread, inital_particle_spread)
		_proton.position.z = randf_range(-inital_particle_spread, inital_particle_spread)
		_proton.position.y += 1
		nucleus_holder.add_child(_proton)

func neutron_init():
	for i in range(neutron[current_neutron_index]):
		var _neutron = NEUTRON.instantiate()
		_neutron.particle_scale = particle_size
		_neutron._ready()
		_neutron.hide()
		_neutron.position.x = randf_range(-inital_particle_spread, inital_particle_spread)
		_neutron.position.z = randf_range(-inital_particle_spread, inital_particle_spread)
		_neutron.position.y += 1
		nucleus_holder.add_child(_neutron)

func electron_init():
	for i in range(electron):
		var _electon = ELECTRON.instantiate()
		nucleus_center_point.add_child(_electon)
		if i >= 2:
			if i >= 10:
				_electon.electron_shell = 3
			else:
				_electon.electron_shell = 2
		else:
			_electon.electron_shell = 1
		_electon.core_ready()
