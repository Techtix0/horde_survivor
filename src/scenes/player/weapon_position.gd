extends Marker2D

@onready var weapon_preload := preload("res://src/scenes/items/basic_gun.tscn")
var weapon

func _ready() -> void:
	# Spawning weapon
	weapon = weapon_preload.instantiate()
	add_child(weapon)

func _physics_process(delta: float) -> void:
	# Calculate new position based on direction to mouse and set distance from player
	var new_position: Vector2 = (get_global_mouse_position() - get_parent().position).normalized()
	self.position = new_position * 50

	# Angle weapon sprite towards the mouse
	look_at(get_global_mouse_position())

	# Flip weapon sprite if it's on the left to prevent it going upside down
	for child in get_children():
		child.flip_v = new_position[0] < 0
