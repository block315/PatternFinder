extends Marker3D
class_name Electron

@export_category("Electron in Core")
@export_enum("K:1", "L:4", "M:6", "N:8") var electron_shell: int = 1
@export var rotation_speed:float = 2.0
@onready var gpu_particles_3d: GPUParticles3D = $GPUParticles3D

@export_category("Electron Bullet")
@export var bullet_mode: bool = false
@export var bullet_speed: float = 1
@export var target_position: Vector3

func core_ready(core_size := 1.0):
	basis = basis.rotated(Vector3(randi(), randi(), randi()).normalized(), randf_range(-PI, PI))
	gpu_particles_3d.position.x += (electron_shell * core_size)

func _process(delta: float) -> void:
	if bullet_mode:
		global_position += (target_position - global_position).normalized() \
		* 0.1 * bullet_speed
	else:
		rotate_object_local(Vector3.UP, delta * rotation_speed)

func shoot(_target_postion:Vector3):
	bullet_mode = true
	target_position = _target_postion

func electron_basis_randomize():
	gpu_particles_3d.position.x -= electron_shell
	basis = basis.rotated(Vector3(randi(), randi(), randi()).normalized(), randf_range(-PI, PI))
	gpu_particles_3d.position.x += electron_shell
	if randi()%2 == 0:
		rotation_speed *= -1
