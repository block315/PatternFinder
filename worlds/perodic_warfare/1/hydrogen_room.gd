extends ElementRoom
class_name HydrogenRoom

func _ready() -> void:
	super._ready()

func _on_hydrogen_003_success() -> void:
	if !PerodicWarfare.access[1][1]:
		PerodicWarfare.access[1][1] = true
		activate_stairs(3)


func _on_hydrogen_001_success() -> void:
	$Content/Hydrogen002.highlight = true
	$Content/Hydrogen001.highlight = false
	$Content/Hydrogen001.done = true


func _on_hydrogen_002_success() -> void:
	pass # Replace with function body.
