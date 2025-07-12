extends SpotLight3D

@export_range(0,1,0.1) var power_consumption:float = 0.5
@export var battery:int = 100
@export var on:bool = false
@onready var timer: Timer = $Timer

func _ready() -> void:
	light_energy = 0

func _process(delta: float) -> void:
	if on and timer.is_stopped():
		timer.start()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("light"):
		on = !on
		if on:
			light_energy = 10
		else:
			light_energy = 0

func _on_timer_timeout() -> void:
	battery -= 1
