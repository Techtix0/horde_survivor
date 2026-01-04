extends State

@export var move_state: State

func enter() -> void:
	print("entering idle state")
	animations.play("idle")
	parent.velocity = Vector2(0, 0)
	super()

func process_input(_event: InputEvent) -> State:
	if move_component.get_movement_direction()[0] != 0:
		return move_state
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	return null
