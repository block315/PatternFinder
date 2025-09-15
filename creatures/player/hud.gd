extends CanvasLayer
class_name HUD

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var hand := $"../Hand"
@onready var flash_light := $"../FlashLight"
@onready var nine_patch_rect: NinePatchRect = $HBoxContainer/VBoxContainer/HBoxContainer3/NinePatchRect
@onready var battery_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar2/BatteryTextureProgressBar
@onready var debug_label: Label = %DebugLabel
@onready var stamina_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar2/StaminaTextureProgressBar
@onready var health_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar1/HealthTextureProgressBar
@onready var player: Player = $"../.."

func _ready() -> void:
	crosshair.position = get_viewport().size/2
	UIAnimation.animate_shrink(nine_patch_rect)
	nine_patch_rect.hide()

func _process(delta: float) -> void:
	health_texture_progress_bar.value = player.health
	stamina_texture_progress_bar.value = player.stamina
	battery_texture_progress_bar.value = flash_light.battery

func display(content:String):
	debug_label.text = content

func yes_or_no(question: String) -> bool:
	var answer: bool
	if !nine_patch_rect.visible:
		nine_patch_rect.show()
		#await UIAnimation.animate_slide_from_left(nine_patch_rect)
	if Input.is_key_pressed(KEY_Y):
		answer = true
	elif Input.is_key_pressed(KEY_N):
		answer = false
	#await UIAnimation.animate_shrink(nine_patch_rect)
	nine_patch_rect.hide()
	return answer
