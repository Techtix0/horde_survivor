extends State

@export var idle_state: State

func enter() -> void:
	animation_name = "run"
	super()

func process_input(event: InputEvent) -> State:
	return null

func process_physics(_delta: float) -> State:
	var movement = move_component.get_movement_direction() * move_component.move_speed

	if movement == Vector2(0, 0):
		return idle_state

	parent.animations.flip_h = movement[0] < 0
	parent.velocity = movement
	parent.move_and_slide()

	return null
