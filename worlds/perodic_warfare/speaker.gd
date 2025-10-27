extends Node3D

@onready var first_stair_audio_stream_player_3d: AudioStreamPlayer3D = $FirstStairAudioStreamPlayer3D
@onready var second_stair_audio_stream_player_3d: AudioStreamPlayer3D = $SecondStairAudioStreamPlayer3D

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	first_stair_audio_stream_player_3d.stop()
	second_stair_audio_stream_player_3d.stop()
