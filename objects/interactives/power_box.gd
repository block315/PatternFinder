extends Area3D
class_name PowerBox

@export var open : = false :
	set(value):
		open = value
		audio_stream_player_3d.play()
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

signal switch(on)

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		animation_player.play("open")
		open = true
		body.hud.switch.connect(_on_switch_on)
		body.hud.display_options("🔌🎚")

func _on_body_exited(body: Node3D) -> void:
	if body is Player and open:
		animation_player.play_backwards("open")
		open = false
		body.hud.hide_options()
		body.hud.switch.disconnect(_on_switch_on)

func _on_switch_on(on:bool):
	switch.emit(on)
