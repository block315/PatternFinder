extends Proposition

@onready var fire_flame: GPUParticles3D = $FireFlame
@onready var flame_light: OmniLight3D = $FireFlame/FlameLight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name.begins_with("Rock") and "matter" in body:
		match body.matter.name:
			"Calcium":
				flame_light.light_color = Color.ORANGE
				fire_flame.process_material.color_ramp = preload("uid://cmj0xjs2u3gp6")
			"Sodium":
				flame_light.light_color = Color.YELLOW
				fire_flame.process_material.color_ramp = preload("uid://cmj0xjs2u3gp6")
			"Lithium":
				flame_light.light_color = Color.RED
				fire_flame.process_material.color_ramp = preload("uid://du4y0mru16ixq")
			"Copper":
				flame_light.light_color = Color.GREEN
				fire_flame.process_material.color_ramp = preload("uid://uhw55exeyfqn")


func _on_area_3d_body_exited(body: Node3D) -> void:
	flame_light.light_color = Color(1,0.49,0.21)
	fire_flame.process_material.color_ramp = preload("uid://dp6iquogm24lf")
