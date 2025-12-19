extends RigidBody3D
class_name Letter

@export var position_in_word: Vector3
@export var scatter_strength: int = 100
@onready var ui_timer: Timer = $"../../UITimer"


func _ready() -> void:
	position_in_word.z -= 1
	position_in_word.y += 0.5
	#global_position = Vector3(randf_range(-10,10), randf_range(2,10), randf_range(-10,10))
	ui_timer.timeout.connect(_on_ui_timer_timeout)

func _process(_delta: float) -> void:
	if Input.is_anything_pressed():
		global_position = lerp(global_position, position_in_word, 0.2)
		rotation = lerp(rotation, Vector3.ZERO, 0.2)

func _physics_process(_delta: float) -> void:
	pass

func _on_ui_timer_timeout() -> void:
	apply_central_force(scatter_strength * Vector3(randf_range(-1,1), randf_range(0,1), randf_range(-1,1)))
