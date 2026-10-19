extends Node2D

func _draw() -> void:
	var ground_color := Color("#344c38")
	draw_rect(Rect2(-2000, -2000, 4000, 4000), ground_color)
