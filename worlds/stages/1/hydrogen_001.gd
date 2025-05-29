extends Proposition

@onready var rubber_duck: Node3D = $wooden_bucket_02_2k/Water/blend_export
var rubber_duck_float_sin: float
@onready var power_box: PowerBox = $PowerBox

@onready var hydrogen_gas: GPUParticles3D = $Prop_Cable_32/HydrogenGas
@onready var oxygen_gas: GPUParticles3D = $Prop_Cable_32/OxygenGas

func _ready() -> void:
	power_box.power_on.connect(_on_power_box_power_on)

func _process(delta: float) -> void:
	rubber_duck_float_sin += delta
	rubber_duck.position.y += sin(rubber_duck_float_sin)*.0002

func _on_power_box_power_on() -> void:
	print("Power Box Activate")
	hydrogen_gas.show()
	oxygen_gas.show()
	success.emit()
