extends ElementRoom
class_name HeliumRoom

func _ready() -> void:
	super._ready()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_chest_found() -> void:
	if !stair_access[0]:
		stair_access[0] = true
		activate_stairs(2)
