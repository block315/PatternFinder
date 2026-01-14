extends Resource
class_name Matter

@export var name: String
@export_enum("Solid:0", "Liquid:1", "Gas:2") var phase: int = 0

@export_category("Visual")
@export var material: Material = null
