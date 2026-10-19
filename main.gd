extends Node2D

var sticks_collected: int = 0

@onready var stick_counter: Label = $CanvasLayer/StickCounter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("test")
	
func collect_stick() -> void:
	sticks_collected += 1
	stick_counter.text = "Sticks: " + str(sticks_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
