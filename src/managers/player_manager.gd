extends Node

signal took_damage

# Player object
var player: Player

# Player health
var max_health: int = 100
var current_health: int = max_health

# Iframes
var iframe_timer: float

func _physics_process(delta: float) -> void:
	self.iframe_timer -= delta

# Refresh the link to the player object
func link_player(player: Player) -> void:
	self.player = player
	self.iframe_timer = player.iframe_time

# Modify health based on damage taken
func take_damage(amount: int) -> void:
	if self.iframe_timer <= 0 && current_health > 0:
		if current_health - amount < 0:
			current_health = 0
		else:
			current_health -= amount
		emit_signal("took_damage")

		self.iframe_timer = player.iframe_time

