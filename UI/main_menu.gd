extends Control

@onready var ui_audio_stream_player: AudioStreamPlayer = $UIAudioStreamPlayer

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://worlds/stages/1/hydrogen_room.tscn")

func _on_start_button_focus_entered() -> void:
	ui_audio_stream_player.play()

func _on_exit_button_focus_entered() -> void:
	ui_audio_stream_player.play()
