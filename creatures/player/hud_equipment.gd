extends TextureRect

@export var active: bool = false:
	set(value):
		print("Icon Coloring...")
		if value:
			texture = load(texture.resource_path.replace("white", "color").replace("White", "Colored"))
			equipment_progress_bar.value = 100
		else:
			texture = load(texture.resource_path.replace("color", "white").replace("Colored", "White"))
			equipment_progress_bar.value = 0
		active = value
@export_enum("Shooter", "Collector", "Breaker") var equipment_type: String
@onready var hud = $"../../../.."
@export var equipment_progress_bar : TextureProgressBar

func _process(delta: float) -> void:
	if hud.hand.current_equipment != null and !active:
		if hud.hand.current_equipment is Shooter and equipment_type == "Shooter":
			active = true
		elif hud.hand.current_equipment is Collector and equipment_type == "Collector":
			active = true
		elif hud.hand.current_equipment is Breaker and equipment_type == "Breaker":
			active = true
	elif hud.hand.current_equipment == null and active:
		active = false
