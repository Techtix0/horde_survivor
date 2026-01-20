extends CanvasLayer

func _ready() -> void:
	# Set health amount to current player health
	%HealthAmount.text = str(PlayerManager.current_health)

	# Connect to the took_damage signal, which calls the update_health function when emitted 
	PlayerManager.took_damage.connect(update_health)

# Update health displayed on hud to match current player health
func update_health() -> void:
	%HealthAmount.text = str(PlayerManager.current_health)
