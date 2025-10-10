extends Proposition

@onready var lemon: Lemon = $Lemon

func _process(_delta: float) -> void:
	if lemon.smashed and !done:
		success.emit()
		done = true
