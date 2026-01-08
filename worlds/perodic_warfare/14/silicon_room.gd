extends ElementRoom
class_name SiliconRoom

func _ready() -> void:
	super._ready()
	activate_stairs(2)
	await animation_player.animation_finished
	activate_stairs(3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
