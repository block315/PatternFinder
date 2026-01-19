extends ElementRoom
class_name ArsenicRoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	activate_stairs(2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
