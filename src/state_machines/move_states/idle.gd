extends State

@export var move_state: State

func enter() -> void:
	animations.play("idle")
	parent.velocity = Vector2(0, 0)
	super()

func process_input(event: InputEvent) -> State:
	if move_component.get_movement_direction() != Vector2(0, 0):
		return move_state
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
