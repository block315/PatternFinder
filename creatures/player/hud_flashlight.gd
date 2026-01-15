extends TextureRect

const PXIEL_FLASHLIGHT = preload("uid://bko5d2l113rcv")
const PXIEL_FLASHLIGHT_OFF = preload("uid://chiuqse6sritk")

@export var active: bool = false:
	set(value):
		if value:
			texture = PXIEL_FLASHLIGHT
		else:
			texture = PXIEL_FLASHLIGHT_OFF
		active = value
@onready var hud: HUD = $"../../../.."

func _process(_delta: float) -> void:
	if not active and hud.hand.get_parent().get_node("FlashLight").on :
		active = true
	elif active and not hud.hand.get_parent().get_node("FlashLight").on:
		active = false
