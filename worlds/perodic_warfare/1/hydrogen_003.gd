extends Proposition

@onready var lemon: Lemon = $Lemon

func _process(delta: float) -> void:
	if lemon.smashed and !done:
		success.emit()
		done = true
