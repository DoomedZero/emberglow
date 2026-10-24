extends Area2D

@export var stick_cost: int = 5

var is_lit: bool = false
var unlit_sprite: Sprite2D
var lit_sprite: Sprite2D


func _ready() -> void:
	add_to_group("interactable")

	var campfire_root := get_parent()

	unlit_sprite = campfire_root.find_child(
		"UnlitSprite", true, false
	) as Sprite2D

	lit_sprite = campfire_root.find_child(
		"LitSprite", true, false
	) as Sprite2D

	if unlit_sprite == null or lit_sprite == null:
		push_error("Campfire: Missing UnlitSprite or LitSprite.")
		return

	unlit_sprite.show()
	lit_sprite.hide()


func get_prompt_text() -> String:
	if is_lit:
		return "Campfire is lit"

	var missing: int = stick_cost - Inventory.sticks

	if missing > 0:
		return "Need %d more stick(s)" % missing

	return "Press E to light campfire (%d sticks)" % stick_cost


func interact() -> void:
	if is_lit:
		print("The campfire is already lit!")
		return

	if not Inventory.spend_sticks(stick_cost):
		print("Not enough sticks!")
		return

	unlit_sprite.hide()
	lit_sprite.show()

	is_lit = true
	print("Campfire lit!")
