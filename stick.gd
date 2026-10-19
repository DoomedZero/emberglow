extends Area2D
signal collected

var player_nearby := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collected.connect(get_tree().current_scene.collect_stick)
	pass # Replace with function body.

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Ma boi founda stick!")
		player_nearby = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false
	
func _process(_delta: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		print("ma boi collected stick!")
		collected.emit()	
		queue_free()
