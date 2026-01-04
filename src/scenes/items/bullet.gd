extends Area2D

@export var speed: float

func init(speed: float) -> void:
	speed = speed

func _physics_process(delta: float) -> void:
	position += transform.x * speed * delta

# TODO: function to handle when it hits an enemy
