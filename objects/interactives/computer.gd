extends StaticBody3D
class_name Computer

@export var content: String

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		print("Computer Working..")
		body.hud.display_options()
