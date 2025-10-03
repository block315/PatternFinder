extends StaticBody3D
class_name Computer

@export var content: String

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		body.hud.display_options(content)
