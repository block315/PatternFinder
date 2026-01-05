extends StaticBody3D
class_name Computer

@export var content: String
@onready var ui_timer: Timer = $"../UITimer"

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player and ui_timer.time_left == 0:
		body.hud.display_options(content)
