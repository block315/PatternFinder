extends Node

var current_room : Room

var element_symbols = {
	1 : ["H", "Hydrogen", "res://worlds/stages/1/hydrogen_room.tscn"],
	2 : ["He", "Helium", "res://worlds/stages/2/helium_room.tscn"],
	3 : ["Li", "Lithium", "res://worlds/stages/3/lithium_room.tscn"],
	4 : ["Be", "Beryllium", "res://worlds/stages/4/beryllium_room.tscn"],
	5 : ["B", "Boron", "res://worlds/stages/5/boron_room.tscn"],
}

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func change_room(next_room:int, player_position=Vector3.ZERO, player_rotation:Vector3=Vector3.ZERO):
	if next_room == 0:
		get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn")
	var pervious_room = current_room
	current_room = load(element_symbols[next_room][2]).instantiate()
	get_tree().get_root().add_child(current_room)
	if pervious_room != null:
		pervious_room.queue_free()
