extends Area2D

var nearby_interactables: Array[Area2D] = []

var interaction_prompt: Control
var prompt_label: Label


func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

	interaction_prompt = get_tree().get_first_node_in_group(
        "interaction_prompt"
	) as Control

	if interaction_prompt != null:
		prompt_label = interaction_prompt.get_node(
            "PromptLabel"
		) as Label
		interaction_prompt.hide()


func _process(_delta: float) -> void:
	var target := _get_closest_interactable()

	_update_prompt(target)

	if Input.is_action_just_pressed("interact"):
		if target != null and target.has_method("interact"):
			target.interact()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("interactable"):
		if not nearby_interactables.has(area):
			nearby_interactables.append(area)


func _on_area_exited(area: Area2D) -> void:
	nearby_interactables.erase(area)


func _get_closest_interactable() -> Area2D:
	var closest: Area2D = null
	var closest_distance: float = INF

	for area in nearby_interactables:
		if not is_instance_valid(area):
			continue

		var distance := global_position.distance_squared_to(
			area.global_position
		)

		if distance < closest_distance:
			closest_distance = distance
			closest = area

	return closest


func _update_prompt(target: Area2D) -> void:
	if interaction_prompt == null or prompt_label == null:
		return

	if not is_instance_valid(target):
		interaction_prompt.hide()
		return

	if target.has_method("get_prompt_text"):
		prompt_label.text = target.get_prompt_text()
	else:
		prompt_label.text = "Press E to interact"

	interaction_prompt.show()
