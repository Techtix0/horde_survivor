extends Node2D

@export var enemy_preload: PackedScene
@export var enemy_spawn_interval: float

var enemy_spawn_timer: float

func _ready() -> void:
	self.enemy_spawn_timer = enemy_spawn_interval

func _physics_process(delta: float) -> void:
	enemy_spawn_timer -= delta

	if enemy_spawn_timer <= 0:
		randomize_spawn_point()
		spawn_enemy()

func spawn_enemy():
	# Instantiate enemy scene and spawn it on the spawnpoint's location
	var enemy = enemy_preload.instantiate()
	self.add_child(enemy)
	enemy.transform = get_node("EnemySpawnPoint").global_transform

	# Reset cooldown
	enemy_spawn_timer = enemy_spawn_interval

func randomize_spawn_point():
	# Generate random angle around player
	var angle = randf_range(0,PI*2)

	# Set the new position to a random point on a circle surrounding the player with a 
	# distance from the player equal to the camera's horizontal width so the enemies spawn off screen
	var new_position = PlayerManager.player.position + Vector2(
		cos(angle), sin(angle)).normalized() * ((get_viewport().get_camera_2d().position - get_viewport_rect().size)[0] * 0.5)

	# Set new position of enemy spawn point
	get_node("EnemySpawnPoint").global_position = new_position 
