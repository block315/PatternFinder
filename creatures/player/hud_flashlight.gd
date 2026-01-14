extends TextureRect

@export var active: bool = false:
	set(value):
		if value:
			texture = load(texture.resource_path.replace("white", "color").replace("White", "Colored"))
		else:
			texture = load(texture.resource_path.replace("color", "white").replace("Colored", "White"))
		active = value
@onready var hud: HUD = $"../../../../../.."

func _process(_delta: float) -> void:
	if not active and hud.hand.get_parent().get_node("FlashLight").on :
		active = true
	elif active and not hud.hand.get_parent().get_node("FlashLight").on:
		active = false
