extends Sprite2D

@export var bullet_preload: PackedScene
@export var fire_speed: float = 100

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("shoot"):
		fire_weapon()

func fire_weapon():
	var bullet = bullet_preload.instantiate()
	bullet.speed = fire_speed
	get_tree().get_nodes_in_group("Player")[0].owner.add_child(bullet)
	bullet.transform = $BulletSpawnPoint.global_transform
