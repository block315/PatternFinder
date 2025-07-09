extends CanvasLayer

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var computer_label: Label = $HBoxContainer/VBoxContainer/ComputerLabel
@onready var hand := $"../Hand"
@onready var nine_patch_rect: NinePatchRect = $HBoxContainer/VBoxContainer/HBoxContainer3/NinePatchRect

func _ready() -> void:
	crosshair.position = get_viewport().size/2
	UIAnimation.animate_shrink(nine_patch_rect)
	nine_patch_rect.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_backspace"):
		if !nine_patch_rect.visible:
			nine_patch_rect.show()
			await UIAnimation.animate_pop(nine_patch_rect)
		else:
			await UIAnimation.animate_shrink(nine_patch_rect)
			nine_patch_rect.hide()


func display(content:String):
	computer_label.text = content
