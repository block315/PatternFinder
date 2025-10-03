extends CanvasLayer
class_name HUD

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var hand := $"../Hand"
@onready var flash_light := $"../FlashLight"
@onready var nine_patch_rect: NinePatchRect = $HBoxContainer/VBoxContainer/HBoxContainer3/NinePatchRect
@onready var battery_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar2/BatteryTextureProgressBar
@onready var debug_label: Label = %DebugLabel
@onready var computer_label: Label = $HBoxContainer/VBoxContainer/HBoxContainer3/NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer/ComputerLabel
@onready var stamina_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar2/StaminaTextureProgressBar
@onready var health_texture_progress_bar: TextureProgressBar = $HBoxContainer/VBoxContainer/StatusBar1/HealthTextureProgressBar
@onready var player: Player = $"../.."

signal switch(on:bool)

func _ready() -> void:
	crosshair.position = get_viewport().size/2
	UIAnimation.animate_shrink(nine_patch_rect)
	nine_patch_rect.hide()

func _process(_delta: float) -> void:
	health_texture_progress_bar.value = player.health
	stamina_texture_progress_bar.value = player.stamina
	battery_texture_progress_bar.value = flash_light.battery
	if nine_patch_rect.visible:
		if Input.is_key_pressed(KEY_Y):
			switch.emit(true)
			hide_options()
		elif Input.is_key_pressed(KEY_X):
			switch.emit(false)
			hide_options()

func display_options(content:String=""):
	computer_label.text = content
	if !nine_patch_rect.visible:
		nine_patch_rect.show()
		await UIAnimation.animate_slide_from_left(nine_patch_rect)

func hide_options():
	if nine_patch_rect.visible:
		await UIAnimation.animate_shrink(nine_patch_rect)
		nine_patch_rect.hide()
