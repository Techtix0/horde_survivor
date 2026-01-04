extends MoveComponent

func get_movement_direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")

func wants_attack() -> bool:
	return false
