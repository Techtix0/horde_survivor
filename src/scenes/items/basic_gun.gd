class_name Weapon
extends Sprite2D

@export var bullet_preload: PackedScene
@export var bullet_speed: float = 100
@export var fire_delay: float = 0.5
@export var bullet_lifetime: float = 1.0

var delay_timer: float = 0

func process_physics(delta: float) -> void:
	delay_timer -= delta

func fire_weapon():
	# Check if able to shoot
	if delay_timer < 0:
		# Spawn in bullet
		var bullet = bullet_preload.instantiate()
		bullet.init(bullet_speed, bullet_lifetime)
		get_tree().get_nodes_in_group("Player")[0].owner.add_child(bullet)

		# Set bullet transform to go in the correct direction
		bullet.transform = $BulletSpawnPoint.global_transform

		# Reset timer
		delay_timer = fire_delay
