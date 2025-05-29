extends Node3D
class_name Proposition

@export_multiline var content:String ## Must be one sentence.
@export var done :bool
@export var required :Array[Proposition]
@export var next :Proposition
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

signal success

func highlight():
	pass
