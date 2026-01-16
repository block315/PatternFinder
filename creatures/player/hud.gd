extends CanvasLayer
class_name HUD

@onready var crosshair: Sprite2D = $CrosshairColorD
@onready var hand := $"../Hand"
@onready var flash_light := $"../FlashLight"
@onready var nine_patch_rect: NinePatchRect = %NinePatchRect
@onready var battery_texture_progress_bar: TextureProgressBar = %BatteryTextureProgressBar
@onready var computer_label: Label = %ComputerLabel
@onready var health_texture_progress_bar: TextureProgressBar = %HealthTextureProgressBar
@onready var stamina_texture_progress_bar: TextureProgressBar = %StaminaTextureProgressBar
@onready var player: Player = $"../.."
@onready var mini_map: TextureRect = %MiniMap

signal switch(on:bool)

func _ready() -> void:
	crosshair.position = get_viewport().size/2
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
		elif Input.is_action_pressed("ui_cancel"):
			hide_options()
	if Input.is_action_just_pressed("map"):
		mini_map.visible = !mini_map.visible

func display_options(content:String=""):
	computer_label.text = content
	if !nine_patch_rect.visible:
		nine_patch_rect.show()

func hide_options():
	if nine_patch_rect.visible:
		nine_patch_rect.hide()
