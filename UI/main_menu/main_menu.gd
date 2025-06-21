extends Control

@export var atomic_ui_noise := 5

@onready var ui_audio_stream_player: AudioStreamPlayer = $UIAudioStreamPlayer

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://worlds/stages/1/hydrogen_room.tscn")

func _on_start_button_focus_entered() -> void:
	ui_audio_stream_player.play()

func _on_exit_button_focus_entered() -> void:
	ui_audio_stream_player.play()

func _on_atomic_ui_timer_timeout() -> void:
	%TitleLabel.label_settings.set("outline_size",randi()%atomic_ui_noise)
	for btn:Button in [%StartButton, %ExitButton]:
		if !btn.is_hovered():
			btn.set("theme_override_constants/outline_size",randi()%atomic_ui_noise)
		else:
			btn.set("theme_override_constants/outline_size",atomic_ui_noise*3)
