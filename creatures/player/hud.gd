extends CanvasLayer

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var computer_label: Label = $HBoxContainer/VBoxContainer/ComputerLabel

func _ready() -> void:
	crosshair.position = get_viewport().size/2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func display(content:String):
	computer_label.text = content
