extends Resource
class_name Matter

@export var name: String
@export_enum("solid:0", "liquid:1", "gas:2") var phase: int = 0
