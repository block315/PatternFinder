extends Collector
class_name Pliers

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var grab_point: Node3D = $GrabPoint

@onready var pliers_bolt_hp: MeshInstance3D = $pliers/Pliers/Skeleton3D/Pliers_bolt_HP
@onready var pliers_hp: MeshInstance3D = $pliers/Pliers/Skeleton3D/Pliers_HP

func _ready() -> void:
	animation_player.play("IDLE")

func collect(target_position, collider):
	super.collect(target_position, collider)
	animation_player.play("OPEN")
	if (grab_point.global_position - target_position).length() < 1.5:
		var tween:Tween = get_tree().create_tween()
		tween.tween_property(self, "global_position", lerp(global_position, target_position, 0.8), 1.0).set_trans(Tween.TRANS_SINE)
		tween.set_parallel(false)
		tween.tween_property(self, "position", handle_position, 1.0).set_trans(Tween.TRANS_SINE)
		await tween.step_finished
		if collider != null and "matter" in collider and collider.matter != null and collider.matter.phase == 0:
			throw()
			animation_player.play("GRAB")
			if collider is RigidBody3D:
				collider.picked.emit()
				collider.set_collision_layer_value(1, false)
				collider.set_collision_mask_value(1, false)
				collider.freeze = true
			collider.reparent(grab_point)
			collection = collider.matter
			collider.position = Vector3.ZERO
		else:
			animation_player.play_backwards("OPEN")
	else:
		await animation_player.animation_finished
		animation_player.play_backwards("OPEN")

func throw():
	animation_player.play("OPEN")
	super.throw()
	if collection != null:
		var _collection = grab_point.get_child(0)
		_collection.reparent(PerodicWarfare.current_room, true)
		if _collection is RigidBody3D:
			_collection.dropped.emit()
			_collection.set_collision_layer_value(1, true)
			_collection.set_collision_mask_value(1, true)
			_collection.freeze = false
		collection = null
	animation_player.play_backwards("OPEN")

func _process(_delta: float) -> void:
	if collection == null and grab_point.get_child_count() > 0:
		grab_point.get_child(0).queue_free()

func _on_picking() -> void:
	for _meshinstance3d in [pliers_bolt_hp, pliers_hp]:
		var _material : StandardMaterial3D = _meshinstance3d.mesh.surface_get_material(0)
		_material.no_depth_test = true
		_meshinstance3d.mesh.surface_set_material(0,_material)

func _on_dropping() -> void:
	for _meshinstance3d in [pliers_bolt_hp, pliers_hp]:
		var _material : StandardMaterial3D = _meshinstance3d.mesh.surface_get_material(0)
		_material.no_depth_test = false
		_meshinstance3d.mesh.surface_set_material(0,_material)
