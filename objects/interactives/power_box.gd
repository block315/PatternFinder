extends Area3D
class_name PowerBox

@export var open : = false :
	set(value):
		open = value
		audio_stream_player_3d.play()
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

signal power_on
signal power_off

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		animation_player.play("open")
		open=true
		if body.hud.yes_or_no("Power Switch"):
			power_on.emit()

func _on_body_exited(body: Node3D) -> void:
	if body is Player and open:
		animation_player.play_backwards("open")
		open=false
		power_off.emit()
