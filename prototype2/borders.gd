extends VBoxContainer

@export var cameraman: Cameraman

func _on_border_reached(border: Vector2):
	if cameraman and not Global.centering:
		cameraman.on_border_reached(border)
