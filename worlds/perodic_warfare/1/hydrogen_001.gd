extends Proposition

@onready var rubber_duck: Node3D = $wooden_bucket_02_2k/rubber_duck_toy
var rubber_duck_float_sin: float
@onready var power_box: PowerBox = $PowerBox
@onready var hydrogen_gas: GPUParticles3D = $Prop_Cable_3/HydrogenGas
@onready var oxygen_gas: GPUParticles3D = $Prop_Cable_3/OxygenGas
@onready var cup: Cup = $Prop_Cable_32/Cup
@onready var wooden_bucket: StaticBody3D = $wooden_bucket_02_2k

const H_2 = preload("res://objects/matters/H_2.tres")
const H_2O = preload("res://objects/matters/H_2O.tres")

func _ready() -> void:
	power_box.switch.connect(_on_power_box_power_on)
	highlight = true

func _process(delta: float) -> void:
	rubber_duck_float_sin += delta
	rubber_duck.position.y += sin(rubber_duck_float_sin)*.0002

func _on_power_box_power_on(on:bool) -> void:
	if on:
		hydrogen_gas.show()
		oxygen_gas.show()
		wooden_bucket.matter = H_2
	else:
		hydrogen_gas.hide()
		oxygen_gas.hide()
		wooden_bucket.matter = H_2O
