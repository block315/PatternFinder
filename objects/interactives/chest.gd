extends StaticBody3D
class_name Chest

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var open = false
@onready var open_audio_stream_player_3d: AudioStreamPlayer3D = $OpenAudioStreamPlayer3D
@onready var close_audio_stream_player_3d: AudioStreamPlayer3D = $CloseAudioStreamPlayer3D

signal found

func _ready() -> void:
	animation_player.play("Chest_Idle_Closed")

func _on_box_looking_area_body_entered(body: Node3D) -> void:
	if body is Player:
		animation_player.play("Chest_Open")
		open=true
		open_audio_stream_player_3d.play()
		if body.hand.current_equipment is Collector and body.hand.current_equipment.collection != null:
			if body.hand.current_equipment.collection.name.to_lower() == $"../..".name.left(-4).to_lower():
				found.emit()
			body.hand.current_equipment.collection = null

func _on_box_looking_area_body_exited(body: Node3D) -> void:
	if body is CharacterBody3D and open:
		animation_player.play("Chest_Close")
		close_audio_stream_player_3d.play()
