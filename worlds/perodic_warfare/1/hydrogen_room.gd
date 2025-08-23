extends Room
class_name HydrogenRoom

func _ready() -> void:
	super._ready()

func _process(delta: float) -> void:
	pass

func _on_hydrogen_001_success() -> void:
	if !stair_access[1]:
		stair_access[1] = true
		activate_stairs(3)

func _on_chest_found() -> void:
	if !stair_access[0]:
		stair_access[0] = true
		activate_stairs(2)
