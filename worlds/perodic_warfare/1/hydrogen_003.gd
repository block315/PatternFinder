extends Proposition

@onready var lemon: Breakable = $"Lemon/Lemon 01"

func _process(_delta: float) -> void:
	if lemon.smashed and !done:
		success.emit(3)
		done = true
