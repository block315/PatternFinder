extends SpotLight3D
class_name FlashLight

@export_range(0,1,0.1) var power_consumption:float = 0.5
@export var battery: int = 100
@export var on: bool = false
@onready var timer: Timer = $Timer
@onready var flashlight: Node3D = $Flashlight

func _ready() -> void:
	light_energy = 0

func _process(_delta: float) -> void:
	if on and timer.is_stopped():
		timer.start()

var changing: bool = false

func _unhandled_input(_event: InputEvent) -> void:
	var tween: Tween = create_tween()
	if Input.is_action_just_pressed("light") and not changing:
		changing = true
		on = !on
		if on:
			tween.tween_property(flashlight, "position:z", -0.672, 0.2)
			tween.tween_property(self, "light_energy", 10, 0.2)
		else:
			light_energy = 0
			tween.tween_property(flashlight, "position:z", 0.4, 0.2)
		tween.finished.connect(func(): changing = false)

func _on_timer_timeout() -> void:
	battery -= 1
