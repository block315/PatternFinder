extends CanvasLayer

@onready var crosshair: Sprite2D = $CrosshairColorD

func _ready() -> void:
	crosshair.position = get_viewport().size/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display(content:String):
	pass
