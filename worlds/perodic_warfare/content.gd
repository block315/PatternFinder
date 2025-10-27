extends Node3D

func _ready() -> void:
	for _proposition:Proposition in get_children():
		PerodicWarfare.propositions[get_parent().atomic_number].append(_proposition.done)
		_proposition.success.connect(update_proposition_success)

func update_proposition_success(proposition_number):
	PerodicWarfare.propositions[get_parent().atomic_number][proposition_number-1] = true
