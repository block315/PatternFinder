extends Room
class_name LithiumRoom

func _ready() -> void:
	super._ready()
	$Player.position = Vector3(0,0,15)

func _process(delta: float) -> void:
	pass
