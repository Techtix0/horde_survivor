extends Node2D

@export var enemy_preload: PackedScene
@export var enemy_spawn_interval: float

var enemy_spawn_timer: float

func _ready() -> void:
	self.enemy_spawn_timer = enemy_spawn_interval

func _physics_process(delta: float) -> void:
	enemy_spawn_timer -= delta

	if enemy_spawn_timer <= 0:
		spawn_enemy()
		randomize_spawn_point()

func spawn_enemy():
	# Instantiate enemy scene and spawn it on the spawnpoint's location
	var enemy = enemy_preload.instantiate()
	self.add_child(enemy)
	enemy.transform = get_node("EnemySpawnPoint").global_transform

	# Reset cooldown
	enemy_spawn_timer = enemy_spawn_interval

func randomize_spawn_point():
	pass

