extends Node3D

const ENEMY_CORE_SPEED:float = 5.0

@onready var path_follow : PathFollow3D = $CorePath/CorePathFollow

func _physics_process(delta: float) -> void:
	path_follow.progress += ENEMY_CORE_SPEED * delta

func _on_player_dead() -> void:
	get_tree().reload_current_scene()
