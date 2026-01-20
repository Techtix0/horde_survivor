extends CharacterBody2D

@export var move_speed: float
@export var damage: int
@export var damage_interval: float
@export var health: int

var player_in_range: bool
var damage_cooldown: float = 0

func _ready() -> void:
	# connects to hurtbox signals
	var hurtbox = get_node("Hurtbox")
	hurtbox.body_entered.connect(on_body_entered)
	hurtbox.body_exited.connect(on_body_exited)
	hurtbox.area_entered.connect(on_area_entered)

	# Set damage interval timer


func _physics_process(delta: float) -> void:
	damage_cooldown -= delta

	# Move towards the player
	velocity = position.direction_to(PlayerManager.player.position) * move_speed
	move_and_slide()

	# If player is in range deal damage
	if player_in_range && damage_cooldown <= 0:
		damage_cooldown = damage_interval
		PlayerManager.take_damage(damage)
	
func on_body_entered(body: Node2D) -> void:
	# Set player in range check to true if player enters attack range
	player_in_range = body.is_in_group("Player")

func on_body_exited(body: Node2D) -> void:
	# Set player in range check to false if player leaves attack range
	player_in_range = !body.is_in_group("Player")
		

func on_area_entered(area: Area2D) -> void:
	# If the area that entered is a bullet from the player take damage
	if area.is_in_group("Player_bullets"):
		health -= area.damage
	
	# When health is drained remove enemy
	if health <= 0:
		self.queue_free()

	# TODO: health bar
	print(health)
