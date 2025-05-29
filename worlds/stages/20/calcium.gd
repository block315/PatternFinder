extends Node3D

@onready var core: Core = $Core
@onready var base_room: Room = $BaseRoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	core.strong_nuclear_force_activate = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
