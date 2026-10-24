extends Area2D

@export var amount: int = 1

var collected: bool = false

func get_prompt_text() -> String:
	return "Press E to collect stick"

func interact() -> void:
	if collected:
		return

	collected = true
	Inventory.add_sticks(amount)

	queue_free()
