extends Area2D

@export var stick_cost: int = 5

var is_lit: bool = false
var flame: Sprite2D


func _ready() -> void:
	add_to_group("interactable")

	# Find the Flame sprite under the Campfire parent.
	flame = get_parent().find_child(
		"Flame", true, false
	) as Sprite2D

	if flame == null:
		push_error("Campfire: Could not find a Sprite2D named 'Flame'.")
		return

	# The flame starts hidden.
	flame.hide()


func get_prompt_text() -> String:
	if is_lit:
		return "Campfire is lit"

	var missing: int = stick_cost - Inventory.sticks

	if missing > 0:
		return "Need %d more stick(s)" % missing

	return "Press E to light campfire (%d sticks)" % stick_cost


func interact() -> void:
	if is_lit:
		return

	if flame == null:
		return

	if not Inventory.has_sticks(stick_cost):
		print("Not enough sticks to light the campfire!")
		return

	if Inventory.spend_sticks(stick_cost):
		flame.show()
		is_lit = true
		print("Campfire lit!")
