extends State

@export var attack_state: State

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("shoot"):
		return attack_state
	return null

func process_physics(delta: float) -> State:
	# Decrease fire delay
	var weapon = parent.get_node("WeaponPosition").get_child(0) 
	weapon.process_physics(delta)
	return null

