class_name Bullet
extends Area2D

var speed: float
var lifetime_timer: float
var damage: int

func init(speed: float, lifetime: float, damage: int) -> void:
	self.speed = speed
	self.lifetime_timer = lifetime
	self.damage = damage

func _physics_process(delta: float) -> void:
	lifetime_timer -= delta
	position += transform.x * speed * delta

	if lifetime_timer < 0:
		self.queue_free()

func on_hit(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		self.queue_free()

