extends Node2D

var sticks_collected: int = 0

@onready var stick_counter: Label = $CanvasLayer/StickCounter
@onready var campfire = $World/Campfire


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game Started!")
	campfire.light_requested.connect(light_campfire)
	
func collect_stick() -> void:
	sticks_collected += 1
	stick_counter.text = "Sticks: " + str(sticks_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func light_campfire() -> void:
	if sticks_collected >= 5:
		sticks_collected -= 5
		stick_counter.text = "Sticks: " + str(sticks_collected)
		campfire.get_node("Flame").visible = true
		print("Campfire lit!")
	else:
		print("Not enough sticks!")
