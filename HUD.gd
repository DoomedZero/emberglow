extends CanvasLayer

@onready var stick_count_label: Label = $StickCountLabel


func _ready() -> void:
	Inventory.sticks_changed.connect(_on_sticks_changed)
	_on_sticks_changed(Inventory.sticks)


func _on_sticks_changed(new_count: int) -> void:
	stick_count_label.text = "Sticks : %d" % new_count
