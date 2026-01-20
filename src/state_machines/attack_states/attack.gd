extends State

@export var idle_state: State

func process_input(event: InputEvent) -> State:
	# Only stop firing if the shoot action is released
	if event.is_action_released("shoot"):
		return idle_state
	return null

func process_physics(delta: float) -> State:
	# Decrease fire delay and fire weapon
	var weapon = parent.get_node("WeaponPosition").get_child(0) 
	weapon.process_physics(delta)
	weapon.fire_weapon()
	return null

