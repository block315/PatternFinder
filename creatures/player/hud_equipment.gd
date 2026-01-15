extends TextureRect
class_name EquipmentUI

const PIXEL_CUP_EMPTY = preload("uid://cx8fxobv80w5v")
const PIXEL_CUP_LIQUID = preload("uid://b6hxmtutpomr2")
const PIXEL_CUP_SOLID = preload("uid://c2c6hunxp5lcn")
const PIXEL_CUP_GAS = preload("uid://cmg8f3aha41bp")

enum Status {EMPTY=0, ACTIVE=1, CARRY=2}

@export var status: Status:
	set(value):
		if value == 1:
			modulate = Color.WHITE
			if equipment_progress_bar != null:
				equipment_progress_bar.modulate = Color.WHITE
		elif value  == 2:
			modulate = Color(0.119, 0.119, 0.119, 0.784)
			if equipment_progress_bar != null:
				equipment_progress_bar.modulate = Color(0.119, 0.119, 0.119, 0.784)
		else:
			modulate = Color(1.0, 1.0, 1.0, 0.0)
			if equipment_progress_bar != null:
				equipment_progress_bar.modulate = Color(1.0, 1.0, 1.0, 0.0)
		status = value

@export_enum("Shooter", "Collector", "Breaker") var equipment_type: String
@onready var hud: HUD = $"../../../.."

@export var equipment_progress_bar : TextureProgressBar

func _process(_delta: float) -> void:
	status = Status.EMPTY
	if hud.hand.current_equipment != null:
		for _equipment in hud.hand.get_children():
			if _equipment is Collector and equipment_type == "Collector":
				status = Status.CARRY
			elif _equipment is Breaker and equipment_type == "Breaker":
				status = Status.CARRY
			elif _equipment is Shooter and equipment_type == "Shooter":
				status = Status.CARRY
		if hud.hand.current_equipment is Collector and equipment_type == "Collector":
			status = Status.ACTIVE
			if hud.hand.current_equipment.collection == null:
				texture = PIXEL_CUP_EMPTY
			elif hud.hand.current_equipment.collection.phase == 0:
				texture = PIXEL_CUP_SOLID
			elif hud.hand.current_equipment.collection.phase == 1:
				texture = PIXEL_CUP_LIQUID
			else:
				texture = PIXEL_CUP_GAS
		elif hud.hand.current_equipment is Breaker and equipment_type == "Breaker":
			status = Status.ACTIVE
		elif hud.hand.current_equipment is Shooter and equipment_type == "Shooter":
			status = Status.ACTIVE
