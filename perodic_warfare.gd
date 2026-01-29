extends Node

var current_room : ElementRoom ## Room that is player in
var train_position : Array[float] = [0.0,0.0,0.0,0.0] ## Manage train
var propositions = [] ## Store game data for perodic warfare
var access = [] ## [first stair, second stair, elevator, train]

## Element information
var element_symbols = {
	1 : ["H", "Hydrogen", "res://worlds/perodic_warfare/1/hydrogen_room.tscn"],
	2 : ["He", "Helium", "res://worlds/perodic_warfare/2/helium_room.tscn"],
	3 : ["Li", "Lithium", "res://worlds/perodic_warfare/3/lithium_room.tscn"],
	4 : ["Be", "Beryllium", "res://worlds/perodic_warfare/4/beryllium_room.tscn"],
	5 : ["B", "Boron", "res://worlds/perodic_warfare/5/boron_room.tscn"],
	6 : ["C", "Carbon", "res://worlds/perodic_warfare/6/carbon_room.tscn"],
	7 : ["N", "Nitrogen", "res://worlds/perodic_warfare/7/nitrogen_room.tscn"],
	8 : ["O", "Oxygen", "res://worlds/perodic_warfare/8/oxygen_room.tscn"],
	9 : ["F", "Fluorine", "res://worlds/perodic_warfare/9/fluorine_room.tscn"],
	10 : ["Ne", "Neon", "res://worlds/perodic_warfare/10/neon_room.tscn"],
	11 : ["Na", "Sodium", "res://worlds/perodic_warfare/11/sodium_room.tscn"],
	12 : ["Mg", "Magnesium", "res://worlds/perodic_warfare/12/magnesium_room.tscn"],
	13 : ["Al", "Aluminium", "res://worlds/perodic_warfare/13/aluminium_room.tscn"],
	14 : ["Si", "Silicon", "res://worlds/perodic_warfare/14/silicon_room.tscn"],
	15 : ["P", "Phosphorus", "res://worlds/perodic_warfare/15/phosphorus_room.tscn"],
	16 : ["S", "Sulfur", "res://worlds/perodic_warfare/16/sulfur_room.tscn"],
	17 : ["Cl", "Chlorine", "res://worlds/perodic_warfare/17/chlorine_room.tscn"],
	18 : ["Ar", "Argon", "res://worlds/perodic_warfare/18/argon_room.tscn"],
	19 : ["K", "Potassium", "res://worlds/perodic_warfare/19/potassium_room.tscn"],
	20 : ["Ca", "Calcium", "res://worlds/perodic_warfare/20/calcium_room.tscn"],
	21 : ["Sc", "Scandium", "res://worlds/perodic_warfare/21/scandium_room.tscn"],
	22 : ["Ti", "Titanium", "res://worlds/perodic_warfare/22/titanium_room.tscn"],
	23 : ["V", "Vanadium", "res://worlds/perodic_warfare/23/vanadium_room.tscn"],
	24 : ["Cr", "Chromium", "res://worlds/perodic_warfare/24/chromium_room.tscn"],
	25 : ["Mn", "Manganese", "res://worlds/perodic_warfare/25/manganese_room.tscn"],
	26 : ["Fe", "Iron", "res://worlds/perodic_warfare/26/iron_room.tscn"],
	27 : ["Co", "Cobalt", "res://worlds/perodic_warfare/27/cobalt_room.tscn"],
	28 : ["Ni", "Nickel", "res://worlds/perodic_warfare/28/nickel_room.tscn"],
	29 : ["Cu", "Copper", "res://worlds/perodic_warfare/29/copper_room.tscn"],
	30 : ["Zn", "Zinc", "res://worlds/perodic_warfare/30/zinc_room.tscn"],
	31 : ["Ga", "Gallium", "res://worlds/perodic_warfare/31/gallium_room.tscn"],
	32 : ["Ge", "Germanium", "res://worlds/perodic_warfare/32/germanium_room.tscn"],
	33 : ["As", "Arsenic", "res://worlds/perodic_warfare/33/arsenic_room.tscn"],
	34 : ["Se", "Selenium", "res://worlds/perodic_warfare/34/selenium_room.tscn"],
	35 : ["Br", "Bromine", "res://worlds/perodic_warfare/35/bromine_room.tscn"],
	36 : ["Kr", "Krypton", "res://worlds/perodic_warfare/36/krypton_room.tscn"],
	37 : ["Rb", "Rubidium", "res://worlds/perodic_warfare/37/rubidium_room.tscn"],
	38 : ["Sr", "Strontium", "res://worlds/perodic_warfare/38/strontium_room.tscn"],
	39 : ["Y", "Yttrium", "res://worlds/perodic_warfare/39/yttrium_room.tscn"],
	40 : ["Zr", "Zirconium", "res://worlds/perodic_warfare/40/zirconium_room.tscn"],
	41 : ["Nb", "Niobium", "res://worlds/perodic_warfare/41/niobium_room.tscn"],
	42 : ["Mo", "Molybdenum", "res://worlds/perodic_warfare/42/molybdenum_room.tscn"],
	43 : ["Tc", "Technetium", "res://worlds/perodic_warfare/43/technetium_room.tscn"],
	44 : ["Ru", "Ruthenium", "res://worlds/perodic_warfare/44/ruthenium_room.tscn"],
	45 : ["Rh", "Rhodium", "res://worlds/perodic_warfare/45/rhodium_room.tscn"],
	46 : ["Pd", "Palladium", "res://worlds/perodic_warfare/46/palladium_room.tscn"],
	47 : ["Ag", "Silver", "res://worlds/perodic_warfare/47/silver_room.tscn"],
	48 : ["Cd", "Cadmium", "res://worlds/perodic_warfare/48/cadmium_room.tscn"],
	49 : ["In", "Indium", "res://worlds/perodic_warfare/49/indium_room.tscn"],
	50 : ["Sn", "Tin", "res://worlds/perodic_warfare/50/tin_room.tscn"],
	51 : ["Sb", "Antimony", "res://worlds/perodic_warfare/51/antimony_room.tscn"],
	52 : ["Te", "Tellurium", "res://worlds/perodic_warfare/52/tellurium_room.tscn"],
	53 : ["I", "Iodine", "res://worlds/perodic_warfare/53/iodine_room.tscn"],
	54 : ["Xe", "Xenon", "res://worlds/perodic_warfare/54/xenon_room.tscn"],
	79 : ["Au", "Gold", "res://worlds/perodic_warfare/79/gold_room.tscn"],
}

func _ready() -> void:
	propositions.resize(119)
	access.resize(119)
	for i in range(propositions.size()):
		propositions[i] = []
	for i in range(access.size()):
		access[i] = [false, false, false, false]
	for _node in get_tree().get_root().get_children():
		if _node is ElementRoom:
			current_room = _node

## change current scene to another element room
func change_room(next_room:int):
	if next_room == 0:
		get_tree().change_scene_to_file("res://UI/main_menu/main_menu.tscn")
	var pervious_room = current_room
	current_room = load(element_symbols[next_room][2]).instantiate()
	get_tree().get_root().add_child(current_room)
	if pervious_room != null:
		pervious_room.queue_free()
	get_tree().get_first_node_in_group("player").hud.mini_map.texture = load("res://arts/2D/UI/originals/pixel-perodic-table/{0}.png".format([next_room]))
