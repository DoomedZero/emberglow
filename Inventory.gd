extends Node

signal sticks_changed(new_count: int)

var sticks: int = 0


func add_sticks(amount: int = 1) -> void:
	if amount <= 0:
		return

	sticks += amount
	sticks_changed.emit(sticks)

	print("Sticks collected: ", sticks)
