extends Node

signal sticks_changed(new_count: int)

var sticks: int = 0


func add_sticks(amount: int = 1) -> void:
	if amount <= 0:
		return

	sticks += amount
	sticks_changed.emit(sticks)
	print("Sticks collected. Total: ", sticks)


func has_sticks(amount: int) -> bool:
	return sticks >= amount


func spend_sticks(amount: int) -> bool:
	if amount <= 0 or sticks < amount:
		return false

	sticks -= amount
	sticks_changed.emit(sticks)
	print("Sticks remaining: ", sticks)

	return true
