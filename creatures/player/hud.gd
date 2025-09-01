extends CanvasLayer
class_name HUD

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var hand := $"../Hand"
@onready var flash_light := $"../FlashLight"
@onready var nine_patch_rect: NinePatchRect = $HBoxContainer/VBoxContainer/HBoxContainer3/NinePatchRect
@onready var battery_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar2/BatteryTextureProgressBar
@onready var debug_label: Label = %DebugLabel

func _ready() -> void:
	crosshair.position = get_viewport().size/2
	UIAnimation.animate_shrink(nine_patch_rect)
	nine_patch_rect.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_text_backspace"):
		if !nine_patch_rect.visible:
			nine_patch_rect.show()
			await UIAnimation.animate_slide_from_left(nine_patch_rect)
		else:
			await UIAnimation.animate_shrink(nine_patch_rect)
			nine_patch_rect.hide()
	battery_texture_progress_bar.value = flash_light.battery

func display(content:String):
	debug_label.text = content
