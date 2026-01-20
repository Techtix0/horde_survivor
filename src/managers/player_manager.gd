extends Node

# Player object
var player: Player

# Player health
var max_health: int = 100
var current_health: int = max_health

func _ready() -> void:
	pass

# Refresh the link to the player object
func link_player(player: Player) -> void:
	self.player = player

# Modify health based on damage taken
func take_damage(amount: int) -> void:
	if current_health > 0:
		if current_health - amount < 0:
			current_health = 0
		else:
			current_health -= amount
		emit_signal("took_damage")
