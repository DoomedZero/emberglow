extends Area2D

signal light_requested

var player_nearby := false

func _process(_delta: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		light_requested.emit()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = true
		print("ma boi is near campfire")

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false
