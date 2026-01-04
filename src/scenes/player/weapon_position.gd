extends Marker2D

@export var distance_from_player: float
@onready var weapon_preload := preload("res://src/scenes/items/basic_gun.tscn")

func _ready() -> void:
	# Spawning weapon
	add_child(weapon_preload.instantiate())

func _physics_process(delta: float) -> void:
	# Calculate new position based on direction to mouse and set distance from player
	var new_position: Vector2 = (get_global_mouse_position() - get_parent().position).normalized()
	self.position = new_position * distance_from_player

	# Angle weapon sprite towards the mouse
	look_at(get_global_mouse_position())

	# Flip weapon sprite if it's on the left to prevent it going upside down
	for child in get_children():
		child.flip_v = new_position[0] < 0
