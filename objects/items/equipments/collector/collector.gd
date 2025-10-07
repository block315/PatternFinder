@icon("res://arts/2D/UI/itch.io/IconGodotNode/node_3D/icon_bucket.png")
extends Equipment
class_name Collector

@export var collection: Matter

func collect(target_position, collider):
	print("collector is collecting from " + collider.name)
