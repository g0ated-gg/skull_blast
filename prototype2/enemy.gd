class_name Enemy extends CharacterBody3D

@export var hp: int:
	set(value):
		var old_value = hp
		hp = 0 if value <= 0 else value
		if hp != old_value:
			hp_changed.emit()
			if hp == 0:
				dead.emit()

signal hp_changed
signal dead

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var gun: Gun = $Gun

func _ready() -> void:
	gun.buffer = Projectiles.enemy_buffer_1

func _physics_process(_delta: float) -> void:
	gun.fire(global_position.direction_to(player.global_position), true)

func _on_dead() -> void:
	queue_free()
