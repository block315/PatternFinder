extends Collector
class_name Tongs

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grab_point: Node3D = $GrabPoint

@onready var tongs_3_001: MeshInstance3D = $LeftTongPivot/Tongs1/Tongs3_001
@onready var tongs_3: MeshInstance3D = $RightTongPivot/Tongs2/Tongs3

func _ready() -> void:
	animation_player.play("Idle")

func collect(target_position, collider):
	super.collect(target_position, collider)
	animation_player.play("Open")
	if (grab_point.global_position - target_position).length() < 1.5:
		var tween:Tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", lerp(global_position, target_position, 0.8), 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel(false)
		tween.tween_property(self, "position", Vector3.ZERO, 1.0).set_trans(Tween.TRANS_SINE)
		await tween.step_finished
		if collider != null and "matter" in collider and collider.matter != null and collider.matter.phase == 0:
			throw()
			animation_player.play("Grab")
			if collider is RigidBody3D:
				collider.set_collision_layer_value(1, false)
				collider.set_collision_mask_value(1, false)
				#collider.set_collision_layer_value(7, true)
				#collider.set_collision_mask_value(7, true)
				collider.freeze = true
			collider.reparent(grab_point)
			collection = collider.matter
			collider.position = Vector3.ZERO
		else:
			animation_player.play_backwards("Open")
	else:
		animation_player.play_backwards("Open")

func throw():
	animation_player.play("Open")
	super.throw()
	if collection != null:
		var _collection = grab_point.get_child(0)
		_collection.reparent(PerodicWarfare.current_room, true)
		if _collection is RigidBody3D:
			_collection.set_collision_layer_value(1, true)
			_collection.set_collision_mask_value(1, true)
			#_collection.set_collision_layer_value(7, false)
			#_collection.set_collision_mask_value(7, false)
			_collection.freeze = false
		collection = null
	animation_player.play_backwards("Open")

func _process(_delta: float) -> void:
	if collection == null and grab_point.get_child_count() > 0:
		grab_point.get_child(0).queue_free()


func _on_picking() -> void:
	for _tongs in [tongs_3_001, tongs_3]:
		var _material : StandardMaterial3D = _tongs.mesh.surface_get_material(0)
		_material.no_depth_test = true
		_tongs.mesh.surface_set_material(0,_material)


func _on_dropping() -> void:
	for _tongs in [tongs_3_001, tongs_3]:
		var _material : StandardMaterial3D = _tongs.mesh.surface_get_material(0)
		_material.no_depth_test = false
		_tongs.mesh.surface_set_material(0,_material)
