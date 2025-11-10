class_name Enemy extends CharacterBody3D

@export var hp: int:
	set(value):
		hp = 0 if value <= 0 else hp - value
		if hp == 0:
			dead.emit()

signal dead

@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var gun: Gun = $Gun

func _ready() -> void:
	gun.buffer = Projectiles.enemy_buffer_1

func _physics_process(_delta: float) -> void:
	gun.fire(global_position.direction_to(player.global_position), true)
