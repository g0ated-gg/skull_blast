class_name Projectile extends CharacterBody3D

@export var direction: Vector3 = Vector3.ZERO
@export var speed: float = 5.0
@export var buffer: Array[Projectile]
@export var max_live_time: float = 5.0
@export var targets: Array[Script]

var live_time: float = 0.0

func _physics_process(delta: float) -> void:
	if not visible:
		return
	if direction and live_time < max_live_time:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		live_time += delta
		var collision = move_and_collide(velocity * delta)
		if collision:
			_return_to_buffer()
	else:
		_return_to_buffer()

func _return_to_buffer() -> void:
	visible = false
	var parent = get_parent_node_3d()
	if parent != null:
		parent.remove_child(self)
		buffer.append(self)
	live_time = 0.0
