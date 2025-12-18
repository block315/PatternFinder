extends SpotLight3D
class_name FlashLight

@export_range(0,1,0.1) var power_consumption:float = 0.5
@export var battery:int = 100
@export var on:bool = false
@onready var timer: Timer = $Timer
@onready var flashlight: Node3D = $Flashlight


func _ready() -> void:
	light_energy = 0

func _process(_delta: float) -> void:
	if on and timer.is_stopped():
		timer.start()

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("light"):
		on = !on
		if on:
			light_energy = 10
			flashlight.show()
		else:
			light_energy = 0
			flashlight.hide()

func _on_timer_timeout() -> void:
	battery -= 1
