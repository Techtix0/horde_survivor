extends CharacterBody2D

@export var move_speed: float
@export var damage: int
@export var damage_interval: float
@export var max_health: int

var health: int 
var player_in_range: bool = false
var damage_cooldown: float = 0
var has_attacked: bool = false

func _ready() -> void:
	self.add_to_group("Enemies")
	self.health = max_health

	# connects to hurtbox signals
	var hurtbox = get_node("Hurtbox")
	hurtbox.body_entered.connect(on_body_entered)
	hurtbox.body_exited.connect(on_body_exited)
	hurtbox.area_entered.connect(on_area_entered)

func _physics_process(delta: float) -> void:
	damage_cooldown -= delta

	# If player is in range deal damage
	if player_in_range && damage_cooldown <= 0:
		damage_cooldown = damage_interval
		PlayerManager.take_damage(damage)
		has_attacked = true
		await get_tree().create_timer(1).timeout
		has_attacked = false

	# Move towards the player
	velocity = position.direction_to(PlayerManager.player.position) * move_speed * int(!has_attacked)
	move_and_slide()

	
func on_body_entered(body: Node2D) -> void:
	# Set player in range check to true if player enters attack range
	if body.is_in_group("Player"):
		player_in_range = true

func on_body_exited(body: Node2D) -> void:
	# Set player in range check to false if player leaves attack range
	if body.is_in_group("Player"):
		player_in_range = false 
		
func on_area_entered(area: Area2D) -> void:
	# If the area that entered is a bullet from the player take damage
	if area.is_in_group("Player_bullets"):
		health -= area.damage
	
		# When health is drained remove enemy
		if health <= 0:
			self.queue_free()
			player_in_range = false
		
		# Change healthbar to reflect current health
		get_node("HealthBar").scale = Vector2(health / float(max_health), 1)

		area.on_hit(self)
