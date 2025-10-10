extends Control

@export var atomic_ui_noise := 5

@onready var ui_audio_stream_player: AudioStreamPlayer = $UIAudioStreamPlayer

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_atomic_ui_timer_timeout() -> void:
	%TitleLabel.label_settings.set("outline_size",randi()%atomic_ui_noise)
	for btn:Button in [%StartButton, %ExitButton]:
		btn.set("theme_override_constants/outline_size",randi()%atomic_ui_noise)

func _on_start_button_button_down() -> void:
	PerodicWarfare.change_room(1)
	queue_free()

func _on_start_button_mouse_entered() -> void:
	ui_audio_stream_player.play()
	%StartButton.set("theme_override_constants/outline_size",atomic_ui_noise*3)


func _on_start_button_mouse_exited() -> void:
	if %StartButton != null:
		%StartButton.set("theme_override_constants/outline_size",randi()%atomic_ui_noise)


func _on_exit_button_mouse_entered() -> void:
	ui_audio_stream_player.play()
	%ExitButton.set("theme_override_constants/outline_size",atomic_ui_noise*3)


func _on_exit_button_mouse_exited() -> void:
	%ExitButton.set("theme_override_constants/outline_size",randi()%atomic_ui_noise)
