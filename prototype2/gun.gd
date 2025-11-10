class_name Gun extends Node3D

@export var projectile_type: PackedScene
@export var buffer: Array[Projectile]
@export var default_offset: Vector3 = Vector3.ZERO
@export var delay: float

@onready var delay_timer: Timer = $DelayTimer

func fire(
	direction: Vector3 = Vector3(0, 0, 1), 
	global_direction: bool = false,
	offset = null
) -> void:
	if not is_zero_approx(delay) and not delay_timer.is_stopped():
		return
	var user = get_parent_node_3d()
	var world = get_tree().get_first_node_in_group("World")
	var projectile: Projectile = buffer.pop_back()
	if not projectile:
		projectile = projectile_type.instantiate()
		projectile.buffer = buffer
	projectile.visible = false
	world.add_child(projectile)
	projectile.global_position = user.global_position
	if global_direction:
		projectile.direction = direction
	else:
		projectile.direction = user.global_transform.basis * direction
	projectile.look_at(projectile.position + projectile.direction)
	offset = default_offset if offset == null else offset
	projectile.position += user.global_transform.basis * offset
	projectile.visible = true
	if not is_zero_approx(delay) and delay_timer.is_stopped():
		delay_timer.start(delay)
