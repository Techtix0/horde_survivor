extends CharacterBody2D

@export var move_speed: float

func _ready() -> void:
	print("Enemy is ready")

func _physics_process(delta: float) -> void:
	velocity = position.direction_to(PlayerManager.player.position) * move_speed
	move_and_slide()
	
func _process(delta: float) -> void:
	pass
