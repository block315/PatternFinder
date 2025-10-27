extends ElementRoom
class_name HydrogenRoom

func _ready() -> void:
	super._ready()

func _on_hydrogen_003_success(_proposition_number) -> void:
	if !PerodicWarfare.access[1][1]:
		PerodicWarfare.access[1][1] = true
		activate_stairs(3)
