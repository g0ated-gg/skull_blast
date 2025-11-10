extends Node

@export var player_buffer: Array[Projectile] = []
@export var enemy_buffer_1: Array[Projectile] = []

var player_projectile = preload("res://prototype2/player_projectile.tscn")
var enemy_projectile_1 = preload("res://prototype2/enemy_projectile_1.tscn")

func  _ready() -> void:
	_make_buffer(player_buffer, player_projectile, 50)
	_make_buffer(enemy_buffer_1, enemy_projectile_1, 20)

func _make_buffer(array: Array[Projectile], type: PackedScene, size: int) -> void:
	for i in range(size):
		var current: Projectile = type.instantiate()
		current.buffer = array
		array.append(current)
