extends Node3D
# class_name Core

@export var atomic_number:int = 1
@export var neutron:Array[int]
@onready var proton_scatter: Node3D = $NucleusHolder/ProtonScatter
@onready var neutron_scatter: Node3D = $NucleusHolder/NeutronScatter


# @onready var room:Room = get_tree().get_root().get_child(0).get_child(0)

func _ready() -> void:
	print("excuting _ready function")
	# atomic_number = room.atomic_number
	make_nucleus(neutron)

func make_nucleus(neutron:Array[int]) -> void:
	while true:
		for i in range(neutron.size()):
			var neutron_number = neutron[i]
			var nucleus_radius:float = .5
			print("making core...", nucleus_radius)
			proton_scatter.modifier_stack.stack[0].amount = atomic_number
			proton_scatter.modifier_stack.stack[0].custom_seed = randi()
			proton_scatter.get_node("ScatterShape").shape.radius = nucleus_radius
			neutron_scatter.modifier_stack.stack[0].amount = neutron_number
			neutron_scatter.get_node("ScatterShape").shape.radius = nucleus_radius
			proton_scatter.modifier_stack.stack[0].custom_seed = randi()
			await get_tree().create_timer(2.0).timeout
