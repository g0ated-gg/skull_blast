extends VBoxContainer

@onready var player_buffer_size: Label = $PlayerBufferSize
@onready var enemy_buffer_1_size: Label = $EnemyBuffer1Size

func _physics_process(_delta: float) -> void:
	player_buffer_size.text = "PlayerBufferSize: %d" % Projectiles.player_buffer.size()
	enemy_buffer_1_size.text = "EnemyBuffer1Size: %d" % Projectiles.enemy_buffer_1.size()
